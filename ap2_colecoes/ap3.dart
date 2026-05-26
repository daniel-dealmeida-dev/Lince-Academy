import 'dart:math';

void main() {
  final  List<int> listaOriginal = [];
  
  //  Inicializa a lista com 50 números aleatórios entre 10 e 21
  // (nextInt(12) gera de 0 a 11. Somando 10, fica entre 10 e 21)
  for (int i = 0; i < 50; i++) {
   listaOriginal.add(Random().nextInt(12) + 10);
  }

  // Pensei em usar if mas lembrei que ao jogar dentro de um set ele pega os valores unicos
  // O Dart automaticamente elimina tudo que for repetido na conversão
 final Set<int> itensUnicos = listaOriginal.toSet(); //também aprendi q o set lida com hash da mesma forma que o map por isso ele "corta" valores repetidos, pra não ter o mesmo hash

  // Imprime as listas formatadas usando o .join()
  print('Lista original: ${listaOriginal.join(' ; ')}');
  print('Itens únicos: ${itensUnicos.join(' ; ')}');
}