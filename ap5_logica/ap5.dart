import 'dart:math';

void main() {
  final random = Random();
  final opcao = random.nextInt(6);

  //Troquei por switch/case
  switch (opcao) {
    case 0:
      print('Opcao invalida');
      break;
    case 1:
      print('Encontrado 1');
      break;
    case 2:
      print('Encontrado 2');
      break;
    case 3:
      print('Encontrado 3');
      break;
    case 4:
      print('Encontrado 4');
      break;
    case 5:
      print('Encontrado final');
      break;
    default:
      print('Opcao invalida'); // Trata qualquer valor que saia do esperado
  }
}