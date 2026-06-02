class Produto {
  final String nome;
  final double preco;

  // Construtor da classe
  Produto(this.nome, this.preco);

  // Método que calcula e retorna o preço com o desconto aplicado
  double desconto(double percentual) {
    // Exemplo: 10% de desconto vira (1 - 0.10) = 0.90 do preço original
    return preco * (1 - (percentual / 100));
  }
}

void main() {
  // lista com 5 produtos
  final listaProdutos = [
    Produto("Smartphone Premium", 4500.00),
    Produto("Notebook Gamer", 7200.50),
    Produto("Fone Bluetooth", 299.90),
    Produto("Monitor 4K", 1850.00),
    Produto("Teclado Mecânico", 450.00),
  ];

  // Defino um valor percentual de desconto, ex: 10%
  final double valorDesconto = 10.0;

  // Percorro a lista e imprimo o resultado
  for (var produto in listaProdutos) {
    double precoComDesconto = produto.desconto(valorDesconto);
        print("Novo preço do produto ${produto.nome} (com desconto) ${precoComDesconto.toStringAsFixed(2)}");
  }
}