void main() {
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria"
  ];

  final nome = 'Ana';
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }
}

int contarNome(List<String> lista, String nomeProcurado) {
  // O .where filtra a lista deixando apenas os nomes que batem com o procurado.
  // O .length conta quantos elementos sobraram nesse filtro.
  return lista.where((nome) => nome == nomeProcurado).length;
}