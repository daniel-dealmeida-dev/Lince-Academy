class Retangulo {
  final double largura;
  final double altura;

  // Construtor da classe
  Retangulo(this.largura, this.altura);

  // Método para calcular e retornar a área
  double calcularArea() {
    return largura * altura;
  }
}

void main() {
  // Criando o retângulo com valores que resultam em uma dízima/várias casas decimais
  final retangulo = Retangulo(5.0, 3.0);

  // Calcular area
  double area = retangulo.calcularArea();

  // Imprimir area
  print("Área do retângulo: $area");
}