import 'dart:math';

// Criação da Interface  
abstract class Forma {
  double calcularArea();
}

// Classe Retangulo implementando a interface Forma
class Retangulo implements Forma {
  // Atributos privados (em Dart, o prefixo '_' torna o atributo privado no arquivo)
  final double _base;
  final double _altura;

  // Construtor com a validação das dimensões
  Retangulo(this._base, this._altura) {
    if (_base <= 0 || _altura <= 0) {
      // Lança a exception se os valores forem menores ou iguais a zero
      throw Exception('Dimensões inválidas, informe apenas valores positivos maiores que zero');
    }
  }

  //  Implementação do método abstrato da interface
  @override
  double calcularArea() {
    return _base * _altura;
  }
}

void main() {
  final random = Random();

  // Utiliza o try-catch para cercar a execução do programa
  try {
    // Gera números aleatórios entre 0.0 e 99.0 usando double
    // nextDouble() gera entre 0.0 e 1.0, multiplico por 99 para dar o escopo
    double baseAleatoria = random.nextDouble() * 99;
    double alturaAleatoria = random.nextDouble() * 99;

    print('Tentando criar retângulo com Base: ${baseAleatoria.toStringAsFixed(2)} e Altura: ${alturaAleatoria.toStringAsFixed(2)}');

    Retangulo meuRetangulo = Retangulo(baseAleatoria, alturaAleatoria);

    // Imprime a área formatada com duas casas decimais
    double area = meuRetangulo.calcularArea();
    print('Area do retângulo: ${area.toStringAsFixed(2)}');

  } catch (e) {
    // Trata e exibe o erro caso a validação do construtor falhe
    print(e);
  }
}