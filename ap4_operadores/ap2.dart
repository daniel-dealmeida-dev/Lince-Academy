void main() {
  List<String> entradas = [
    '10', '2XXL7', 'JOJ0', '99', '381', 'AD44', '47', '2B', '123', '78'
  ];

  // Chamo a função de conversão passando a minha lista de strings
  List<int> resultado = converterParaNumeros(entradas);

  // Usei o método .join(', ') para juntar todos os números da lista em uma única linha separada por vírgulas,
  // exatamente igual ao formato do exemplo de saída
  print('Lista convertida: ${resultado.join(', ')}');
}

// Essa função recebe a lista de textos e devolve uma nova lista cheia de números inteiros
List<int> converterParaNumeros(List<String> textos) {
  // Usei o método .map() que percorre cada texto da lista e já transforma no que eu preciso.
 
  return textos.map((texto) {
    
    // Se falhar, ele retorna null. Aí o operador '??' se for null, ele assume o 0.
    return int.tryParse(texto) ?? 0;
    
  }).toList();  // No final, coloco o .toList() para salvar tudo de volta em formato de Lista.
}