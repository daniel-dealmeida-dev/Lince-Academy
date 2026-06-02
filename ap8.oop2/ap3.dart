// Primeira classe abstrata: Comportamento de combate
abstract class Assassino {
  void causarDanoExplosivo();
}

// Segunda classe abstrata: Comportamento de recurso
abstract class CampeaoSemMana {
  void usarHabilidadeSemCusto();
}

// Classe concreta que implementa os dois
class Yone implements Assassino, CampeaoSemMana {
  final String nome = "Yone";

  @override
  void causarDanoExplosivo() {
    print("O $nome avancou com o Desatar da Alma e explodiu o alvo.");
  }

  @override
  void usarHabilidadeSemCusto() {
    print("O $nome usou o Aço mortal sem gastar nenhuma mana.");
  }
}

void main() {
  final yone = Yone();

  yone.causarDanoExplosivo();
  yone.usarHabilidadeSemCusto();
}
