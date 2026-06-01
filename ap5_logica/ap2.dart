import 'dart:math';

String numeroParaLetra(int numero) {
  // Na tabela ASCII, a letra 'A' é o código 65. 
  // Somando o número recebido a 64, garanto que 1 vire A já que 65==A, 2 vire B  ou 66, etc
  return String.fromCharCode(64 + numero);
}

void main() {
  // aqui eu crio um objeto da classe random
  Random random = Random();

  // Um loop simples para rodar exatamente 5 vezes.
  for (int i = 0; i < 5; i++) {
    // Gera um número de 1 a 26  po conta que tem 26 letras do alfabeto.
    int numeroAleatorio = random.nextInt(26) + 1;
    
    // Descobre a letra chamando a função.
    String letra = numeroParaLetra(numeroAleatorio);
    
    print('Numero $numeroAleatorio -> Letra $letra');
  }
}