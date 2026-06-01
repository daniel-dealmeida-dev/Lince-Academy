import 'dart:math';

int somarParesAte(int valorMaximo) {
  int soma = 0;

  for (int i = 0; i <= valorMaximo; i += 2) {
    soma += i;
  }

  // Devolvemos o total acumulado da soma.
  return soma;
}

void main() {
  Random random = Random();

  // Para gerar um número entre 100 e 1000:
  int numeroAleatorio = random.nextInt(901) + 100;
  
  int resultadoSoma = somarParesAte(numeroAleatorio);
  
  print('A soma dos números pares entre 0 e $numeroAleatorio é $resultadoSoma');
}