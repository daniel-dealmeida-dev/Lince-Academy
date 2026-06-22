import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color corAtual = Colors.white;

  void mudarTudo(){
    setState((){

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
    body: Center(
      child: Column( // Usei Column para alinhar o texto acima do botão
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Texto com cor sorteada',
            style: TextStyle(
              fontSize: 30,
              color: corAtual, // AQUI está o requisito: mudar a cor do texto
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: mudarTudo,
            child: const Text('Sortear cor'), // O texto do botão também pede o requisito
          ),
        ],
      ),
    ),
  );
}
}