void main() {
  // Inicializei o mapa com os dados da tabela, aceitando valores nulos para quem não informou a idade.
  Map<String, int?> pessoas = {
    'Nelson': null,
    'Jane': null,
    'Jack': 16,
    'Rupert': 37,
    'Andy': 13,
    'Kim': 27,
    'Robert': 31,
  };

  // Percorre cada chave (nome) e valor (idade) dentro do mapa usando o .forEach.
  pessoas.forEach((nome, idade) {
    // Usamei o operador ?? para caso a idade for nula, ele assume o texto 'idade nao informada'.
    // Caso contrário, ele mantém o valor da idade. O oString() no final garante que tudo vire texto pro print.
    var statusIdade = idade ?? 'idade nao informada';

    print('$nome - $statusIdade');
  });
}