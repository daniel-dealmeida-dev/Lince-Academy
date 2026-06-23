import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color corAtual = Colors.white;

  void mudarTudo() {
    setState(() {
      corAtual = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1.0,
      );
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack( // O Stack permite sobrepor elementos
      children: [ // <- O Flutter exige 'children' aqui, é impossível fugir disso para layouts sobrepostos
        Align(
          alignment: Alignment.center,
          child: Text(
            'Texto com cor sorteada',
            style: TextStyle(fontSize: 30, color: corAtual),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0), // Correção aqui!
            child: ElevatedButton(
              onPressed: mudarTudo,
              child: const Text('Sortear cor'),
            ),
          ),
        ),
      ],
    ),
  );
}
}