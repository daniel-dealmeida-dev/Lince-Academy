import 'dart:math';

void main() {
  final random = Random();

  // Inicializa a lista com 15 números inteiros aleatórios entre 1 e 5000
  // O nextInt(5000) gera de 0 a 4999, aí somando 1 o intervalo fica de 1 a 5000 certinho
  List<int> numeros = List.generate(15, (_) => random.nextInt(5000) + 1);

  // Lembrei do método .sort() que organiza os elementos da lista.
  // Como não passei nenhum parâmetro dentro dele, o Dart já entende que é pra ordenar os inteiros em ordem crescente por padrão
  numeros.sort();

  print('--- Exibindo números em ordem crescente e suas bases --- \n');

  // Percorre a lista que acabei de ordenar para transformar e imprimir cada número
  for (int numero in numeros) {
    // Chamei as funções de conversão que criei ali embaixo passando o número atual do laço
    String decimal = converterParaDecimal(numero);
    String binario = converterParaBinario(numero);
    String octal = converterParaOctal(numero);
    String hexadecimal = converterParaHexadecimal(numero);

    // Print para mostrar os dados no console bem organizados igual o exemplo pediu
    print('decimal: $decimal, binário: $binario, octal: $octal, hexadecimal: $hexadecimal');
  }
}


// Essa função só serve para passar o número para String e manter a estrutura das outras
String converterParaDecimal(int numero) {
  return numero.toString();
}

// Aprendi que o método .toRadixString(base) faz toda a mágica da conversão de base sem eu precisar fazer conta na mão
// Passando o número 2, o Dart já calcula e devolve o valor em binário
String converterParaBinario(int numero) {
  return numero.toRadixString(2);
}

// Como o "radix" controla a base, para o sistema Octal é só passar o número 8 ali dentro
String converterParaOctal(int numero) {
  return numero.toRadixString(8);
}

// E para o Hexadecimal é a mesma lógica, só passar o número 16 no parâmetro do radix
String converterParaHexadecimal(int numero) {
  return numero.toRadixString(16);
}