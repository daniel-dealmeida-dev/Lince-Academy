import 'dart:collection';
import 'dart:math';

void main() {
  final filaMercado = FilaMercado();
  final gerador = GeradorDeNomes();

  print('--- PESSOAS ENTRANDO NA FILA ---');
  for (int i = 0; i < 10; i++) {
    final nomeCompleto = gerador.gerarNomeAleatorio();
    filaMercado.entrarNaFila(Pessoa(nomeCompleto));
  }

  print('\n--- ATENDIMENTO INICIADO ---');
  while (filaMercado.possuiPessoas) {
    filaMercado.atenderPessoa();
  }
}

class Pessoa {
  // Garantindo tipagem estrita (sem usar dynamic)
  Pessoa(this.nomeCompleto);
  final String nomeCompleto;
}

//  Classe separada focada apenas em gerar nomes e sobrenomes aleatórios
class GeradorDeNomes {
  final _random = Random();
  
  final _nomes = ['João', 'Maria', 'Pedro', 'Ana', 'Lucas', 'Carla', 'José', 'Beatriz', 'Marcos', 'Letícia'];
  final _sobrenomes = ['Silva', 'Santos', 'Oliveira', 'Souza', 'Pereira', 'Almeida', 'Costa', 'Ribeiro', 'Rodrigues', 'Lima'];

  String gerarNomeAleatorio() {
    final nome = _nomes[_random.nextInt(_nomes.length)];
    final sobrenome = _sobrenomes[_random.nextInt(_sobrenomes.length)];
    return '$nome $sobrenome';
  }
}

class FilaMercado {
  // Usando Queue do dart:collection especializada em mexer nas pontas
  final Queue<Pessoa> _fila = Queue<Pessoa>();

  //  Quem entra na fila vai para o final dela (fim da fila)
  void entrarNaFila(Pessoa pessoa) {
    _fila.addLast(pessoa);
    print('${pessoa.nomeCompleto} entrou na fila');
  }

  void atenderPessoa() {
    if (_fila.isEmpty) {
      print('A fila já está vazia!');
      return;
    }
    
    // removeFirst tira o primeiro elemento da fila (o mais antigo)
    final pessoaAtendida = _fila.removeFirst();
    print('${pessoaAtendida.nomeCompleto} foi atendido(a)');
  }

  // Getters para ajudar no controle do laço do main()
  bool get possuiPessoas => _fila.isNotEmpty;
}