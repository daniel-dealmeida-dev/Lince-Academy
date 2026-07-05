import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Pessoa(nome: 'João Pedro', idade: 70),
      child: const MyApp(),
    ),
  );
}

class Pessoa with ChangeNotifier {
  String nome;
  int idade;

  Pessoa({required this.nome, required this.idade});

  void incrementarIdade() {
    idade++;
    notifyListeners();
  }

  void decrementarIdade() {
    idade--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<Pessoa>( //mlehor coisa que já aprendi. ele vai ficar observando a classe pessoa e quando ela mudar, ele vai reconstruir o widget
        builder: (context, pessoa, child) => Scaffold(
          appBar: AppBar(title: const Center(child: Text('Exemplo Provider'))),
          body: Center(
            child: Text(

              pessoa.nome + '' +
              ' tem ${pessoa.idade} anos de idade',

              style: const TextStyle(fontSize: 30),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => pessoa.incrementarIdade(),
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => pessoa.decrementarIdade(),
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
