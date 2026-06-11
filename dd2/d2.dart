import 'dart:math';

void main() {
  final pessoa = Pessoa();

  print('INICIO DA SIMULAÇÃO');

  // [REQUISITO]: Altere o programa para se basear no nível de calorias para definir se a pessoa precisa de refeições
  while (pessoa.precisaComer) {
    // [REQUISITO]: Alterar o programa para escolher um novo fornecedor aleatoriamente para cada "refeição"
    final fornecedorAleatorio = Fornecedor.obterAleatorio();
    pessoa.refeicao(fornecedorAleatorio);
  }

  pessoa.informacoes();
}

// [REQUISITO]: Nas informações da pessoa, adicione uma lógica "status" do nível de calorias (dica: utilizar um enum)
enum StatusCalorico {
  deficitExtremo('Deficit extremo de calorias'),
  deficit('Deficit de calorias'),
  satisfeita('Pessoa está satisfeita'),
  excesso('Excesso de calorias');

  final String descricao;
  const StatusCalorico(this.descricao);
}

// [REQUISITO]: IMPORTANTE: para a realização desse exercício, nao deve ser utilizado dynamic.
class Produto {
  Produto(this.nome, this.calorias);

  final String nome;
  final int calorias; 
}

abstract class Fornecedor {
  Produto fornecer();

  static Fornecedor obterAleatorio() {
    final random = Random();
    
    // [REQUISITO]: Criar novos fornecedores: sanduíches, bolos, saladas, petiscos, ultra-calóricos
    final fornecedores = <Fornecedor>[
      FornecedorDeBebidas(),
      FornecedorDeSanduiches(),
      FornecedorDeBolos(),
      FornecedorDeSaladas(),
      FornecedorDePetiscos(),
      FornecedorDeUltraCaloricos(),
    ];
    
    return fornecedores[random.nextInt(fornecedores.length)];
  }
}

class FornecedorDeBebidas extends Fornecedor {
  final _random = Random();
  final _produtos = [
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  @override
  Produto fornecer() => _produtos[_random.nextInt(_produtos.length)];
}

class FornecedorDeSanduiches extends Fornecedor {
  final _random = Random();
  final _produtos = [
    Produto('X-Burguer', 450),
    Produto('Misto-Quente', 280),
    Produto('Sanduiche Natural', 210),
  ];

  @override
  Produto fornecer() => _produtos[_random.nextInt(_produtos.length)];
}

class FornecedorDeBolos extends Fornecedor {
  final _random = Random();
  final _produtos = [
    Produto('Bolo de Chocolate', 350),
    Produto('Bolo de Fubá', 220),
    Produto('Bolo de Cenoura com Cobertura', 390),
  ];

  @override
  Produto fornecer() => _produtos[_random.nextInt(_produtos.length)];
}

class FornecedorDeSaladas extends Fornecedor {
  final _random = Random();
  final _produtos = [
    Produto('Salada de folhas Verdes', 45),
    Produto('Salada Caesar', 290),
    Produto('Salada de tomate com aipim frito', 65),
  ];

  @override
  Produto fornecer() => _produtos[_random.nextInt(_produtos.length)];
}

class FornecedorDePetiscos extends Fornecedor {
  final _random = Random();
  final _produtos = [
    Produto('Batata Frita', 400),
    Produto('Coxinha', 180),
    Produto('Aneis de Cebola', 250),
  ];

  @override
  Produto fornecer() => _produtos[_random.nextInt(_produtos.length)];
}

class FornecedorDeUltraCaloricos extends Fornecedor {
  final _random = Random();
  final _produtos = [
    Produto('Pote de Sorvete 500ml', 950),
    Produto('Pizza Inteira', 1600),
    Produto('Hambúrguer Triplo com Bacon', 1100),
  ];

  @override
  Produto fornecer() => _produtos[_random.nextInt(_produtos.length)];
}

class Pessoa {
  int _caloriasConsumidas = 0;
  int _refeicoesRealizadas = 0;

  // [REQUISITO]: Altere o programa para definir um nível inicial de calorias aleatoriamente ao instanciar uma pessoa
  Pessoa() {
    _caloriasConsumidas = Random().nextInt(2001); 
  }

  bool get precisaComer => _caloriasConsumidas <= 1800;

  // [REQUISITO]: Lógica "status" do nível de calorias baseada nas faixas do enunciado
  StatusCalorico get status {
    switch (_caloriasConsumidas) {
      case <= 500:
        return StatusCalorico.deficitExtremo;
      case <= 1800:
        return StatusCalorico.deficit;
      case <= 2500:
        return StatusCalorico.satisfeita;
      default:
        return StatusCalorico.excesso;
    }
  }

  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    _refeicoesRealizadas++; 
  }

  void informacoes() {
    print('Calorias atuais: $_caloriasConsumidas');
    print('Status: ${status.descricao}');
    // [REQUISITO]: Imprima o número de refeições realizadas nas informações da pessoa
    print('Total de refeições feitas: $_refeicoesRealizadas'); 
  }
}