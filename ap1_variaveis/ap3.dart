import 'dart:math';

void main(){
  // Gerando um número aleatório entre 0 e 100 usando a classe Random do Dart
  Random random = Random();
  final int numeroAleatorio = random.nextInt(101); // Gera um número entre 0 e 100
  final int numeroAleatorio2 = random.nextInt(101); // Gerando outro número aleatório para comparação
  print("Números aleatórios gerados: $numeroAleatorio e $numeroAleatorio2");

  // invertendo o número usando o operador de negação (-)
  final int numeroInvertido = -numeroAleatorio;
  final int numeroInvertido2 = -numeroAleatorio2; // Invertendo o segundo número aleatório
  print("Números invertidos: $numeroInvertido e $numeroInvertido2");
 
}
// não foi possível usar um const devido a natureza do método random, pois ele gera um número diferente a cada execução, e o valor de uma const deve ser conhecido em tempo de compilação. O operador de negação (-) é usado para inverter o sinal do número, ou seja, transformar um número positivo em negativo e vice-versa.