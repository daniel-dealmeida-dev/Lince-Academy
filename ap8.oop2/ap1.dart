import 'dart:math';

//enum
enum GeneroMusical { rock, pop, jazz, eletronica, rap, sertanejo, bossaNova }

void main() {
  final random = Random();

  final todosGeneros = GeneroMusical.values;

  int indiceAleatorio = random.nextInt(todosGeneros.length);

  final generoEscolhido = todosGeneros[indiceAleatorio];

  print("Meu gênero musical preferido é o ${generoEscolhido.name}");
}
