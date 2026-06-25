import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MaterialApp(home: Scaffold(body: GeradorDeFormas())));

class GeradorDeFormas extends StatefulWidget {
  const GeradorDeFormas({super.key});

  @override
  State<GeradorDeFormas> createState() => _GeradorDeFormasState();
}

class _GeradorDeFormasState extends State<GeradorDeFormas> {
  bool isQuadrado = true;
  Color corAtual = Colors.yellow;

  final List<Color> cores = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple
  ];

  void alternarForma() {
    setState(() {
      isQuadrado = !isQuadrado;
    });
  }

  void mudarCor() {
    setState(() {
      corAtual = cores[Random().nextInt(cores.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: alternarForma,
              child: Text(isQuadrado ? 'Mudar para círculo' : 'Mudar para quadrado'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: mudarCor,
              child: const Text('Cor aleatória'),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: corAtual,
            shape: isQuadrado ? BoxShape.rectangle : BoxShape.circle,
          ),
        ),
      ],
    );
  }
}