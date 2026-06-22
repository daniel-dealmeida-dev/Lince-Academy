import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  //runApp
  /*
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Aplicativo Olá Mundo',
            style: TextStyle(fontSize: 50, color: Colors.blueGrey),
          ),
        ),
        body: Center(
          child: Text(
            'Olá Mundo',
            style: TextStyle(fontSize: 100, color: Colors.indigo),
          ),
        ),
      ),
    ),
  );
*/
}
//statelessW colocando isso cria um stateless widget sozinho

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //construtor passando uma key pro super

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Aplicativo Olá Mundo',
            style: TextStyle(fontSize: 50, color: Colors.blueGrey),
          ),
        ),
        body: Center(
          child: Text(
            'Olá Mundo',
            style: TextStyle(fontSize: 100, color: Colors.indigo),
          ),
      ),
    ),
  );
}
}