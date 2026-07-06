import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen")),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,            children:[
              ElevatedButton(
                onPressed:()=> Navigator.pushNamed(context, '/list'),
                child: const Text("Ver Lista de Pessoas"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:()=> Navigator.pushNamed(context, '/form'),
                child: const Text("Adicionar Pessoa"),
              ),
          ],
        ),
      ),
    );
  }
}