import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jogo de Adivinhação')),
      body: Center(child: MyWidget()),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();
  late int botaoCorreto;
  int click = 0;
  bool perdeu = false;
  bool ganhou = false;

  @override
  void initState() {
    super.initState();
    botaoCorreto = random.nextInt(3); // Sorteia o botão 0, 1 ou 2
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        ganhou = true;
      } else {
        click++;
        if (click >= 2) {
          perdeu = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ganhou) {
      return Container(
        color: Colors.green,
        child: const Center(
          child: Text('Você ganhou!', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
      );
    }

    if (perdeu) {
      return Container(
        color: Colors.red,
        child: const Center(
          child: Text('Você perdeu!', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => tentativa(0),
          child: const Text('Botão A'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => tentativa(1),
          child: const Text('Botão B'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => tentativa(2),
          child: const Text('Botão C'),
        ),
      ],
    );
  }
}