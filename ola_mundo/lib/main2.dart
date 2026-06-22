import 'package:flutter/material.dart';

void main() {

  int valor = 10;
  runApp(MyApp(title: 'Aplicativo Olá Mundo', valor: valor));
 valor++;
}
//statelessW colocando isso cria um stateless widget sozinho

class MyApp extends StatelessWidget {
 final String title;
 final int valor;
  const MyApp({super.key, this.title = '', this.valor = 0}); //construtor passando uma key pro super

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  Text(
            this.title
          ),
        ),
        body: Center(
          child: Text(
            'Olá Mundo, valor é '+ this.valor.toString(),
            style: TextStyle(fontSize: 100, color: Colors.indigo),
          ),
      ),
    ),
    
  );
}
}