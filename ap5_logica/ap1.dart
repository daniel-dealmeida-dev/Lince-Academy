List<int> gerarImpares(int valorMaximo) {
  List<int> impares = [];

  // Começa do 1  e vaaipulando de 2 em 2 (1, 3, 5, etc)
  // enquanto o número for menor ou igual ao valor limite fornecido.
  for (int i = 1; i <= valorMaximo; i += 2) {
    impares.add(i);
  }

  // Retorna a lista com os números ímpares.
  return impares;
}

void main() {
  int limite = 9;
  
  List<int> resultado = gerarImpares(limite);
  
  // Percorrs a lista resultante usando o for in para printar cada item no formato exato.
  for (int numero in resultado) {
    print('Impar: $numero');
  }
}