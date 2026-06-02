class ContaBancaria {
  String titular;
  double saldo;

  // Construtor da classe
  ContaBancaria(this.titular, this.saldo);

  // Método para depositar
  void depositar(double valor) {
    if (valor > 0) {
      saldo += valor;
      print("Depósito de R\$ ${valor.toStringAsFixed(2)} realizado.");
    } else {
      print("Valor de depósito inválido.");
    }
  }

  // Método para sacar
  void sacar(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      print("Saque de R\$ ${valor.toStringAsFixed(2)} realizado.");
    } else if (valor > saldo) {
      print("Saldo insuficiente.");
    } else {
      print("Valor de saque inválido.");
    }
  }

  // Método para exibir o saldo
  void exibirSaldo() {
    print("Saldo atual: ${saldo.toStringAsFixed(2)}");
  }
}

void main() {
  // Criando a conta com o saldo para bater o exemplo
  var minhaConta = ContaBancaria("Fulano", 10049.99);

  // Fazendo um saque para chegar no valor esperado
  minhaConta.sacar(50.00);

  // Imprimindo o resultado no console
  minhaConta.exibirSaldo();
}