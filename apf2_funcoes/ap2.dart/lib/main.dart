import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Center(child: MyWidget()))));

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Container para ser o retângulo escuro que envolve os 4 conjuntos
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 18, 32, 47), // Cor do "retângulo escuro"
      child: SingleChildScrollView( // 2. Scroll para evitar o erro de overflow
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Pilha(
              backgroundColor: Colors.grey,
              children: [Colors.red, Colors.green, Colors.blue],
            ),
            Pilha(
              backgroundColor: Colors.black,
              children: [Colors.cyan, Colors.purple, Colors.yellow],
            ),
            Pilha(
              backgroundColor: Colors.transparent,
              children: [Colors.red, Colors.yellow, Colors.blue],
            ),
            Pilha(
              backgroundColor: Colors.white,
              children: [Colors.purple, Colors.orange, Colors.yellow, Colors.lime],
            ),
          ],
        ),
      ),
    );
  }
}

class Pilha extends StatelessWidget {
  const Pilha({super.key, this.backgroundColor, required this.children});

  final Color? backgroundColor;
  final List<Color> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: backgroundColor,
      width: 100,
      height: 100,
      child: Stack(
        children: [
          for (var index = 0; index < children.length; index++)
            Positioned(
              top: index * 10.0, 
              left: index * 10.0,
              child: Container(
                width: 50,
                height: 50,
                color: children[index],
              ),
            ),
        ],
      ),
    );
  }
}