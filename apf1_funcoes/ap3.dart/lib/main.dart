import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MaterialApp(home: JogoApp()));

// Adicione isto no topo do seu arquivo, antes da classe JogoApp
enum JogoEstado { 
  jogando, 
  ganhou, 
  perdeu 
}

class JogoApp extends StatefulWidget {
  const JogoApp({super.key});

  @override
  State<JogoApp> createState() => _JogoAppState();
}

class _JogoAppState extends State<JogoApp> {
  final random = Random();
  late int botaoCorreto;
  int cliques = 0;
  int vitorias = 0;
  int derrotas = 0;
  JogoEstado estado = JogoEstado.jogando;

  @override
  void initState() {
    super.initState();
    reiniciarJogo();
  }

  void reiniciarJogo() {
    setState(() {
      botaoCorreto = random.nextInt(3);
      cliques = 0;
      estado = JogoEstado.jogando;
    });
  }

  void verificar(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        estado = JogoEstado.ganhou;
        vitorias++;
      } else {
        cliques++;
        if (cliques >= 2) {
          estado = JogoEstado.perdeu;
          derrotas++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vitórias: $vitorias | Derrotas: $derrotas')),
      body: Center(
        // Switch exaustivo para decidir qual Widget mostrar
        child: switch (estado) {
          JogoEstado.jogando => TelaJogo(onOpcao: verificar),
          JogoEstado.ganhou => TelaResultado(titulo: 'Você ganhou!', cor: Colors.green, onReiniciar: reiniciarJogo),
          JogoEstado.perdeu => TelaResultado(titulo: 'Você perdeu!', cor: Colors.red, onReiniciar: reiniciarJogo),
        },
      ),
    );
  }
}

// Widget da Tela de Jogo
class TelaJogo extends StatelessWidget {
  final Function(int) onOpcao;
  const TelaJogo({super.key, required this.onOpcao});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['A', 'B', 'C'].asMap().entries.map((e) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () => onOpcao(e.key), child: Text('Botão ${e.value}')),
      )).toList(),
    );
  }
}

// Widget Genérico para Resultado
class TelaResultado extends StatelessWidget {
  final String titulo;
  final Color cor;
  final VoidCallback onReiniciar;

  const TelaResultado({super.key, required this.titulo, required this.cor, required this.onReiniciar});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulo, style: const TextStyle(fontSize: 30, color: Colors.white)),
          ElevatedButton(onPressed: onReiniciar, child: const Text('Reiniciar Jogo')),
        ],
      ),
    );
  }
}