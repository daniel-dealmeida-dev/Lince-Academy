void main() {
  // Lista fornecida 
  List<int> numeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];

  // Primeiro: Ordenar a lista em ordem crescente
    numeros.sort();


  // Segundo Usar um laço (for-in ou for ou forOf) para percorrer a lista ordenada
  for (final numero in numeros) {
  // Terceiro: Converter o número para as bases necessárias
    final binario = numero.toRadixString(2); //converte para representação em String na base necessária. Base 2 é binário.
    final octal = numero.toRadixString(8); // base octal
    final hexadecimal = numero.toRadixString(16); //base hexadecimal

  // Quarto Printar no formato exato que o enunciado pede
    print('decimal: $numero, binário: $binario, octal: $octal, hexadecimal: $hexadecimal');
  }
}