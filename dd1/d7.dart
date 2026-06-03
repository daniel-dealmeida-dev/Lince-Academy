void main() {
  // Lista de números i
  List<int> numeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];

  // Primeiro: Utilizar o comando for 
  int somaFor = 0;
  for (int i = 0; i < numeros.length; i++) {
    somaFor += numeros[i];
  }

  // Segundo: Utilizar o comando while 
  int somaWhile = 0;
  int contador = 0;
  while (contador < numeros.length) {
    somaWhile += numeros[contador];
    contador++;
  }

  // Terceiro: Utiliza um método recursivo (é um método que chama a sí mesmo, tem que ter uma condicional de parada ou entra em loop eterno)
  int somaRecursiva = somarRecursivo(numeros);

  // Quarto: Utilizar o método .fold() com valor inicial zero (fold é um método que pega um conjunto de elmentos e utiliza um por vez em uma função, nesse caso a função é a soma))
  int somaColecao = numeros.fold(0, (parcial, elemento) => parcial + elemento);// parcial é o valor acumulado até o momento e elemento é o valor atual da iteração.

  // Exibindo a saída exatamente no formato esperado pelo enunciado
  print('for: $somaFor  while: $somaWhile  recursão: $somaRecursiva  lista: $somaColecao');
}

// Função recursiva: chama a si mesma reduzindo a lista até que ela fique vazia 
int somarRecursivo(List<int> lista) {
  if (lista.isEmpty) {
    return 0; // Condição de parada: lista vazia retorna zero
  }
  // Soma o primeiro elemento atual com o resultado do restante da lista (sublist)
  return lista.first + somarRecursivo(lista.sublist(1));
}