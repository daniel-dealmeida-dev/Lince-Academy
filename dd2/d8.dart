import 'dart:math';

void main() {
  final todasAsFiguras = [
    Figura(1, 'Neymar Jr'),
    Figura(2, 'Lionel Messi'),
    Figura(3, 'Cristiano Ronaldo'),
    Figura(4, 'Kylian Mbappé'),
    Figura(5, 'Erling Haaland'),
    Figura(6, 'Vini Jr'),
    Figura(7, 'Kevin De Bruyne'),
    Figura(8, 'Mohamed Salah'),
    Figura(9, 'Harry Kane'),
    Figura(10, 'Robert Lewandowski'),
    Figura(11, 'Luka Modrić'),
    Figura(12, 'Jude Bellingham'),
    Figura(13, 'Bukayo Saka'),
    Figura(14, 'Antoine Griezmann'),
    Figura(15, 'Son Heung-min'),
    Figura(16, 'Lautaro Martínez'),
    Figura(17, 'Bruno Fernandes'),
    Figura(18, 'Rodrygo'),
    Figura(19, 'Alisson Becker'),
    Figura(20, 'Ederson'),
  ];

  final album = Album();
  int pacotesAbertos = 0;

  // Loop roda até o álbum atingir 20 figuras coladas
  while (!album.estaCompleto) {
    final pacote = PacoteDeFiguras(todasAsFiguras);
    pacotesAbertos++;

    for (final figura in pacote.figuras) {
      album.colarFigura(figura);
    }
  }

  print('--- ÁLBUM COMPLETO ---');
  print('Pacotes abertos: $pacotesAbertos');
  print('Total de figuras repetidas: ${album.quantidadeRepetidas}\n');

  print('--- FIGURAS COLADAS EM ORDEM ---');
  album.imprimirAlbum();
}

class Figura {
  Figura(this.codigo, this.nome);
  final int codigo;
  final String nome;
}

class PacoteDeFiguras {
  final List<Figura> figuras = [];

  // Construtor gerando 4 figurinhas aleatórias
  PacoteDeFiguras(List<Figura> listaBase) {
    final random = Random();
    for (int i = 0; i < 4; i++) {
      final indiceAleatorio = random.nextInt(listaBase.length);
      figuras.add(listaBase[indiceAleatorio]);
    }
  }
}

class Album {
  // usar um Set porque ele nao aceita elementos repetidos por padrão
  final Set<Figura> _figurasColadas = {};
  
  // Lista para guardar as repetidas, conforme o enunciado pediu
  final List<Figura> _figurasRepetidas = [];

  bool get estaCompleto => _figurasColadas.length == 20;
  int get quantidadeRepetidas => _figurasRepetidas.length;

  void colarFigura(Figura novaFigura) {
    // Como o Set não deixa repetir pelo objeto, vamos checar manualmente pelo código
    final jaTem = _figurasColadas.any((f) => f.codigo == novaFigura.codigo);

    if (jaTem) {
      _figurasRepetidas.add(novaFigura); // É repetida
    } else {
      _figurasColadas.add(novaFigura);   // Cola no álbum
    }
  }

  void imprimirAlbum() {
    // usar o Set, transformando em List para conseguir ordenar
    final listaOrdenada = _figurasColadas.toList();
    
    // O .sort ordena comparando o código da figura A com a figura B
    listaOrdenada.sort((a, b) => a.codigo.compareTo(b.codigo));

    for (final figura in listaOrdenada) {
      print('[ N° ${figura.codigo} ] - ${figura.nome}');
    }
  }
}