import 'dart:math';

void main() {
  // Chamei a função A passando a referência da função B (sem parênteses, só o objeto dela)
  // O Dart vai rodar a lógica da função A usando os cálculos que defini na B
  int resultadoB = funcaoA(funcaoB);

  // Fiz o mesmo processo aqui, mas agora a função A vai usar a lógica da função C
  int resultadoC = funcaoA(funcaoC);

  // Imprime os resultados finais das combinações na tela
  print('Resultado de A(B): $resultadoB');
  print('Resultado de A(C): $resultadoC');
}

// Essa é a função de Alta Ordem. Ela recebe outra função que aceita um int e retorna um int.
// Usei o tipo 'int Function(int)' para deixar o parâmetro bem tipado e seguro.
int funcaoA(int Function(int) funcaoParametro) {
  final random = Random();

  // Gerando dois números aleatórios entre 1 e 10 para passar para a função parâmetro
  int num1 = random.nextInt(10) + 1;
  int num2 = random.nextInt(10) + 1;

  // Lembrei que aqui dentro eu USO os parênteses para executar a função que recebi!
  // Ela vai rodar duas vezes, cada uma com um número aleatório diferente.
  int execucao1 = funcaoParametro(num1);
  int execucao2 = funcaoParametro(num2);

  // Só para eu conseguir ver no console o que está acontecendo por debaixo dos panos
  print('Função A executou com os números aleatórios ($num1) e ($num2). Resultados: $execucao1 e $execucao2');

  // Retorna a soma dos dois resultados gerados pela função que veio por parâmetro
  return execucao1 + execucao2;
}

// Escolhi fazer o quadrado do número (multiplicar ele por ele mesmo)
int funcaoB(int numero) {
  return numero * numero;
}

// Escolhi fazer o triplo do número mais cinco, só para testar uma expressão diferente
int funcaoC(int numero) {
  return (numero * 3) + 5;
}