import 'dart:math';

class Pessoa {
  String _nome = "";
  int _idade = 0;
  double _altura = 0.0;

  // Construtor
  Pessoa(String nome) {
    this._nome = nome;
  }

  // Getter e Setter para o Nome
  String get nome => _nome;
  set nome(String valor) => _nome = valor;

  // Getter para a Idade
  int get idade => _idade;

  // Setter para a Idade com validação
  set idade(int valor) {
    if (valor >= 0) {
      _idade = valor;
    } else {
      print("Erro: A idade não pode ser negativa.");
    }
  }

  // Getter e Setter para a Altura
  double get altura => _altura;
  set altura(double valor) => _altura = valor;
}

void main() {
  final random = Random();

  // aqui crio o objeto da classe Pessoa
  var pessoa = Pessoa("Carlos Silva");

  // Gero idade aleatória entre 1 e 100
  int idadeAleatoria = random.nextInt(100) + 1;

  // Gerando altura aleatória entre 1.0 e 2.3
  double alturaAleatoria = 1.0 + random.nextDouble() * 1.3;

  // Atribuindo os valores utilizando os setters
  pessoa.idade = idadeAleatoria;
  pessoa.altura = alturaAleatoria;

  // Exibindo no console utilizando os getters para obter os valores
  print("Nome: ${pessoa.nome}");
  print("Idade: ${pessoa.idade}");
  print("Altura: ${pessoa.altura.toStringAsFixed(2)}");
}