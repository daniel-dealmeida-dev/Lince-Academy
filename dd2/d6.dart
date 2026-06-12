import 'dart:collection';

  void main() {
    final baralho = Baralho();

    baralho
    ..empilhar(Carta('A', Naipe.paus))
    ..empilhar(Carta('A', Naipe.copas))
    ..empilhar(Carta('A', Naipe.espadas))
    ..empilhar(Carta('A', Naipe.ouros));

  print('--- Status Inicial ---');
  print('Total de cartas no baralho: ${baralho.quantidadeDeCartas}\n');

  print('--- Removendo as cartas (Do Topo) ---');
  while (baralho.possuiCartas) {
    final cartaRemovida = baralho.removerDoTopo();
    print('Carta removida: ${cartaRemovida.valor} de ${cartaRemovida.naipe.simbolo}');
  }

  print('\n--- Status Final ---');
  print('Total de cartas no baralho: ${baralho.quantidadeDeCartas}');
}

enum Naipe {
  paus('♣'),    // U+2663
  copas('♥'),   // U+2665
  espadas('♠'), // U+2660
  ouros('♦');   // U+2666

  final String simbolo;
  const Naipe(this.simbolo);
}

class Carta {
  Carta(this.valor, this.naipe);

  final String valor;
  final Naipe naipe;
}

class Baralho {
  final Queue<Carta> _cartas = Queue<Carta>();

  void empilhar(Carta carta) {
    _cartas.addLast(carta); 
  }

  Carta removerDoTopo() {
    if (_cartas.isEmpty) {
      throw Exception('O baralho está vazio!');
    }
    return _cartas.removeLast();
  }

  // Getters auxiliares para deixar o loop do main() mais limpo
  bool get possuiCartas => _cartas.isNotEmpty;
  int get quantityDeCartas => _cartas.length;
  
  int get quantidadeDeCartas => _cartas.length;
}