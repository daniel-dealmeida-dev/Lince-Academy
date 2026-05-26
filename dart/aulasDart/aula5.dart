void main() {
  // O 'late' ativa a inicialização preguiçosa (chamada de Lazy).
  // A função _getValorTotal() nao é chamada aqui. O Dart fica esperando.
  late double resultado = _getValorTotal();

  print('Chamando a função main');
  
  // Se eu tirasse o comentário da linha abaixo, aí sim a função seria chamada:
  // print(resultado); 
}

double _getValorTotal() {
  print('Chamando a função getValorTotal');
  return 0.0;
}