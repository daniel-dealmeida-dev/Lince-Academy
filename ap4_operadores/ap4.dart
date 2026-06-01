int calcularDesconto(double valorOriginal, double valorComDesconto) {
  // subtraí de 1 para achar a fatia do desconto, multipliquei por 100  
  // e o round() garante que o resultado venha como um número inteiro bonitinho.
  return ((1 - (valorComDesconto / valorOriginal)) * 100).round();
}

void main() {
  double original = 10.0;
  double comDesconto = 7.0;
  
  // Chamo a função passando os valores e guardando o resultado inteiro na variável.
  int porcentagem = calcularDesconto(original, comDesconto);
  
  // Exibo a mensagem final, usei o toInt() no print apenas para sumir com o 0 
  // dos valores double e deixar o texto idêntico ao exemplo pedido.
  print('O produto custava ${original.toInt()} reais, foi vendido por ${comDesconto.toInt()} reais. O desconto dado foi $porcentagem%.');
}