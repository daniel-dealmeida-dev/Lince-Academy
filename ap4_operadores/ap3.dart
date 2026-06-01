void main() {
  List<int> lista1 = [1, 2, 3, 4, 5];
  print('Original: $lista1 -> Removendo 3: ${removerElemento(lista1, 3)}');

  List<int>? listaNula = null;
  print('Lista Nula -> Resultado: ${removerElemento(listaNula, 2)}');

  List<int> lista3 = [10, 20, 30];
  print('Original: $lista3 -> Removendo null: ${removerElemento(lista3, null)}');
}

List<int> removerElemento(List<int>? lista, int? elemento) {
  
  // Criamos uma lista segura que no caso é se a lista original for nula, o ?? já cria uma lista vazia
  List<int> listaSegura = lista ?? [];

  // Usei o operador ternário para decidir se preciso ou não remover o elemento.
  elemento != null ? listaSegura.remove(elemento) : null;

  // No final, retorno a lista que foi modificada 
  return listaSegura;
}