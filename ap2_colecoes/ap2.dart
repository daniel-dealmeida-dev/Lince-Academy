import 'dart:math';

void main() {
  List<int> lista = [];
  // 1. Mudamos para int puro, já que não vamos aceitar nulos aqui dentro
  List<int> listaPar = []; 
  int numeroAleatorio;
  
  do {
    numeroAleatorio = Random().nextInt(15);
    lista.add(numeroAleatorio);

    // 2. Só adiciona na listaPar se o número atual for par
    if (numeroAleatorio % 2 == 0) {
      listaPar.add(numeroAleatorio);
    }

  } while (lista.length < 50);

  print('Lista original (Tam: ${lista.length}): $lista\n');
  print('Lista de Pares (Tam: ${listaPar.length}): $listaPar\n');
}