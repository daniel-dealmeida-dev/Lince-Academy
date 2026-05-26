import 'dart:math';

void main() {
  final List<int> lista = [];
  final random = Random();

  // Inicializei a lista com 50 números aleatórios entre 0 e 15
  for (int i = 0; i < 50; i++) {
    lista.add(random.nextInt(16)); // nextInt(16) gera de 0 a 15
  }

  // Imprime a lista original formatada com .join()
  print('Lista original: ${lista.join(' ; ')}\n');

  // removeWhere passa limpando todos os pares
  // remova o número ONDE o número resto 2 for igual a zero
  lista.removeWhere((numero) => numero % 2 == 0);

  // Imprime a lista atualizada 
  print('Lista atualizada: ${lista.join(' ; ')}');
}