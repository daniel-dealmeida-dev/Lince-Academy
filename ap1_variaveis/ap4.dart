import 'dart:math';

void main(){

  Random random = Random();

  final int numeroAleatorio1 = random.nextInt(101); // Gera um número entre 0 e 100
  final int numeroAleatorio2 = random.nextInt(100)+1; // Gerando outro número aleatório entre 1 e 100 pra não acontecer divisão por zero

  final double divicaoDecimal = numeroAleatorio1 / numeroAleatorio2; // Operador de divisão decimal

  final int divicaoInteira = numeroAleatorio1 ~/ numeroAleatorio2; // Operador de divisão inteira (funciona como o trunc ou Match.floor() do javaScript)

  print("Números aleatórios gerados: $numeroAleatorio1 e $numeroAleatorio2");
  print("Divisão decimal: ${divicaoDecimal.toStringAsFixed(2)}");
  print("Divisão inteira: $divicaoInteira");
}