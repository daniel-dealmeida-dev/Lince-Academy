void main() {
  // 1. Nullable Type (Tipo que aceita Nulo)
  // O ponto de interrogação (?) avisa ao Dart que essa variável 
  // PODE receber um valor nulo (null) além de strings.
  String? nomeNullable = null; 
  print(nomeNullable); // Imprime: null


  // 2. Non-Nullable Type (Tipo que NÃO aceita Nulo)
  // Por padrão, as variáveis no Dart não aceitam nulo. 
  // Se você tentar rodar o código abaixo, o compilador nem deixa o programa iniciar.
  
  // String nomeNoNull = null; // ERRO DE COMPILAÇÃO: O valor 'null' não pode ser atribuído a uma String.
  
  String nomeNoNull = 'Daniel'; // Jeito correto: precisa obrigatoriamente iniciar com uma String.
  print(nomeNoNull); // Imprime: Daniel
}