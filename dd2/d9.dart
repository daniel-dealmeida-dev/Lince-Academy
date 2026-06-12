import 'dart:math';

void main() {
  final controleDePessoas = ControleDePessoas();
  // Cadastrando pessoas no sistema
  controleDePessoas
    ..cadastrarPessoa(Pessoa('Jose', Mes.abril))
    ..cadastrarPessoa(Pessoa('Arthur', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Joao', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jesse', Mes.dezembro))
    ..cadastrarPessoa(Pessoa('Roberta', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Carla', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Thania', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Rafaela', Mes.marco))
    ..cadastrarPessoa(Pessoa('Yuri', Mes.junho))
    ..cadastrarPessoa(Pessoa('Jonas', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Elias', Mes.outubro))
    ..cadastrarPessoa(Pessoa('Abel', Mes.maio))
    ..cadastrarPessoa(Pessoa('Danilo', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jonathan', Mes.abril))
    ..cadastrarPessoa(Pessoa('Joseph', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Abdul', Mes.janeiro))
    ..cadastrarPessoa(Pessoa('Jean', Mes.abril));

  // Passar por todos os meses com pessoas, e imprimir os nomes das pessoas
  for (final mes in controleDePessoas.mesesComPessoas) {
    print('\n${mes.name}');

    for (final pessoa in controleDePessoas.pessoasPorMes(mes)) {
      print(' > ${pessoa.nome}');
    }
  }
}

enum Mes {
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro,
}

class Pessoa {
  Pessoa(this.nome, this.mesDeNascimento);

  final String nome;
  final Mes mesDeNascimento;
}

class ControleDePessoas {
  final _pessoasPorMes = <Mes, List<Pessoa>>{};

  // Método de cadastro usando atribuição condicional de nulo (??=)
  void cadastrarPessoa(Pessoa pessoa) {
    final mesDaPessoa = pessoa.mesDeNascimento;

    _pessoasPorMes[mesDaPessoa] ??= <Pessoa>[];

    // Adiciona a pessoa na lista
    _pessoasPorMes[mesDaPessoa]!.add(pessoa);
  }

  // Pega apenas os meses que possuem pessoas
  List<Mes> get mesesComPessoas {
    final listaDeMeses = _pessoasPorMes.keys.toList();
    
    listaDeMeses.sort((mesA, mesB) {
      if (mesA.index < mesB.index) {
        return -1;
      }
      
      if (mesA.index > mesB.index) {
        return 1;
      }
      
      // Se forem iguais, retorna 0 (não muda eles de lugar)
      return 0;
    });
    
    return listaDeMeses;
  }

  List<Pessoa> pessoasPorMes(Mes mes) {
    return _pessoasPorMes[mes] ?? <Pessoa>[];
  }
}