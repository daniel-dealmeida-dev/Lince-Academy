//Interface Arquivo usando uma classe abstrata
abstract class Arquivo {
  void abrir();
}

// Classe ArquivoTexto que implementa a interface
class ArquivoTexto implements Arquivo {
  final String _nome;

  ArquivoTexto(this._nome);

  // Método abrir com try-catch interno e relançamento de erro
  @override
  void abrir() {
    try {
      // simulando uma condição de erro: se o nome do arquivo for "virus.txt" ou vazio, ele falha
      if (_nome.contains('virus') || _nome.trim().isEmpty) {
        throw Exception('Falha crítica no sistema de arquivos.');
      }

      print('Arquivo "$_nome" aberto com sucesso!');
      
    } catch (e) {
      // Captura o erro interno e lança a mensagem exata exigida pelo enunciado
      throw Exception('Erro ao abrir o arquivo $_nome');
    }
  }
}

void main(List<String> args) {
  try {
    // bloco try-catch para tratar a leitura do nome do arquivo 
    if (args.isEmpty) {
      // Se o usuário não digitar nada, forçamos um erro de entrada inválida
      throw FormatException();
    }

    String nomeDoArquivo = args[0];

    // Se a entrada for válida, cria o objeto e tenta abrir
    ArquivoTexto meuArquivo = ArquivoTexto(nomeDoArquivo);
    meuArquivo.abrir();

  } on FormatException {
    // Trata o erro de digitação/entrada do terminal
    print('Entrada invalida. Digite um nome valido.');
  } catch (e) {
    //Captura o erro que veio lá de dentro do método abrir()
    // O enunciado pede para usar o 'rethrow' aqui para relançar a exceção
    print('Capturado no main: $e');
    print('Relançando a exceção com rethrow...');
    rethrow; 
  } finally {
    // exibe a mensagem obrigatória ao final de tudo
    print('Fim do programa');
  }
}