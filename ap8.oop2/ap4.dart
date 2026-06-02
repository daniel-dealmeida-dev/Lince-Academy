import 'dart:math';

abstract class Calculadora {
  
  // Métodos estáticos pertencem à classe e não às instâncias
  static int dobro(int numero) {
    return numero * 2;
  }
}

void main() {

  final random = Random();

  int numeroAleatorio = random.nextInt(1000) + 1;

  // Utilizando o método estático sem nem precisqar instanciar a classe
  int resultado = Calculadora.dobro(numeroAleatorio);

  print("O dobro do numero $numeroAleatorio e: $resultado");
}