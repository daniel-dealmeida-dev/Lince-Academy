import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const RotaInicial(),
        '/cor': (context) {
          return RotaCor(ModalRoute.of(context)!.settings.arguments as Color);
        },
      },
    );
  }
}

class ItensDaLista {
  const ItensDaLista(this.cor, this.texto);
  final Color cor;
  final String texto;
}

class RotaInicial extends StatelessWidget {
  const RotaInicial({super.key});

  final List<ItensDaLista> cores = const [
    ItensDaLista(Colors.red, "Vermelho"),
    ItensDaLista(Colors.green, "Verde"),
    ItensDaLista(Colors.blue, "Azul"),
    ItensDaLista(Colors.purple, "Roxo"),
    ItensDaLista(Colors.orange, "Laranja"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha uma cor'),
      ),
      body: ListView.builder(
        itemCount: cores.length,
        itemBuilder: (context, index) {
          final item = cores[index];
          return CorItem(item.cor, item.texto);
        },
      ),
    );
  }
}

class RotaCor extends StatelessWidget {
  const RotaCor(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Corrigido para AppBar
        title: const Text("Cor selecionada"),
      ),
      body: Container(
        color: color,
      ),
    );
  }
}

class CorItem extends StatelessWidget {
  const CorItem(this.cor, this.texto, {super.key});

  final Color cor;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/cor', arguments: cor);
      },
      child: Container(
        color: cor, 
        height: 50,
        child: Center(
          child: Text(texto),
        ),
      ),
    );
  }
}