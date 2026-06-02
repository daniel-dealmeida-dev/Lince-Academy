abstract class Animal {
  void comer();
  void beber();
}

class Cachorro extends Animal {
  @override
  void beber() {
    print("O animal esta bebendo.");
  }

  @override
  void comer() {
    print("O animal esta comendo.");
  }

  void latir() {
    print("O cachorro esta latindo.");
  }
}

void main() {
  final meuCachorro = Cachorro();

  meuCachorro.beber();
  meuCachorro.comer();
  meuCachorro.latir();
}
