void main() {
  final biblioteca = Biblioteca();

  // Cadastr as músicas na biblioteca
  biblioteca
    ..cadastrarMusica(Musica('In the End', 'Linkin Park', 'Hybrid Theory', 216))
    ..cadastrarMusica(Musica('Numb', 'Linkin Park', 'Meteora', 187))
    ..cadastrarMusica(Musica('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 355))
    ..cadastrarMusica(Musica('Lost in heaven', 'Chase Atlantic', 'Lost in heaven', 390));

  print('--- 1. EXIBINDO A BIBLIOTECA ---');
  biblioteca.imprimirBiblioteca();

  print('\n--- 2. REALIZANDO AS BUSCAS ---');
  
  print('-> Buscando título "Numb":');
  biblioteca.buscarPorTitulo('Numb');

  print('\n-> Buscando artista "Linkin Park":');
  biblioteca.buscarPorArtista('Linkin Park');

  print('\n-> Buscando álbum "Lost in heaven":');
  biblioteca.buscarPorAlbum('Lost in heaven');
}

class Musica {

  final String titulo;
  final String artista;
  final String album;
  final int duracaoSegundos;

  Musica(this.titulo, this.artista, this.album, this.duracaoSegundos);
}

class Biblioteca {
  final List<Musica> _musicas = <Musica>[];

  void cadastrarMusica(Musica musica) {
    _musicas.add(musica);
  }

  // Imprimir os dados gerais e calcular o tempo
  void imprimirBiblioteca() {
    print('Músicas Cadastradas:');
    int totalSegundos = 0;

    for (final musica in _musicas) {
      print('• ${musica.titulo} - ${musica.artista} (Álbum: ${musica.album})');
      totalSegundos += musica.duracaoSegundos; // Soma o tempo de cada uma
    }

    final tempoEmHoras = totalSegundos / 3600;

    print('\nTotal de músicas: ${_musicas.length}');
    print('Tempo total da biblioteca: ${tempoEmHoras.toStringAsFixed(2)} horas');
  }

  void buscarPorTitulo(String titulo) {
    for (final musica in _musicas) {
      if (musica.titulo == titulo) {
        print('   Encontrada: ${musica.titulo} de ${musica.artista}');
        return; 
      }
    }
    print('   Nenhuma música encontrada com esse título.');
  }

  // Busca por Artista (pode ter mais de um música do mesmo artista)
  void buscarPorArtista(String artista) {
    bool achouPeloMenosUma = false;

    for (final musica in _musicas) {
      if (musica.artista == artista) {
        print('   Encontrada: ${musica.titulo} (Álbum: ${musica.album})');
        achouPeloMenosUma = true;
      }
    }

    if (!achouPeloMenosUma) {
      print('   Nenhum registro encontrado para este artista.');
    }
  }

  // Busca por Álbum
  void buscarPorAlbum(String album) {
    bool achouPeloMenosUma = false;

    for (final musica in _musicas) {
      if (musica.album == album) {
        print('   Encontrada: ${musica.titulo} de ${musica.artista}');
        achouPeloMenosUma = true;
      }
    }

    if (!achouPeloMenosUma) {
      print('   Nenhum registro encontrado para este álbum.');
    }
  }
}