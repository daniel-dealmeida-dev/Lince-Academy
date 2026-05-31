import 'dart:math';

void main() {
  final random = Random();

  // Inicializa a lista com 10 raios aleatórios entre 1 e 100
  // Usei o nextInt(100) + 1 porque o nextInt vai de 0 a 99. Somando 1, o intervalo fica de 1 a 100 certinho
  List<double> raios = List.generate(
    10,
    (_) => (random.nextInt(100) + 1).toDouble(),
  );

  // Percorre a lista de raios para fazer os cálculos e mostrar os dados de cada círculo
  for (double raio in raios) {
    // Chamei as funções que criei passando o raio atual do laço repetição
    double area = calcularArea(raio);
    double perimetro = calcularPerimetro(raio);

    // assim o console não fica poluído com aqueles números gigantes cheios de pontos flutuantes.
    print(
      'Raio: ${raio.toStringAsFixed(0)}, área: ${area.toStringAsFixed(2)}, perímetro: ${perimetro.toStringAsFixed(2)}',
    );
  }
}

// Função simples que calcula a área. Ela recebe o raio e devolve um double
double calcularArea(double raio) {
  // Acessei a constante 'pi' direto da biblioteca dart:math.
  // Usei a função pow(raio, 2) que serve para elevar o raio ao quadrado
  return pi * pow(raio, 2);
}

// Função que calcula o perímetro (comprimento da circunferência)
double calcularPerimetro(double raio) {
  // Aplicação direta da fórmula de matemática: 2 * pi * raio
  return 2 * pi * raio;
}
