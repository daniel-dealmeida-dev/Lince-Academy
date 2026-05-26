void main() {
  //  Mapa básico (Chave: Cidade, Valor: Estado)
  // Montando assim, fica mais fácil de eu conseguir ler cidade por cidade
  final Map<String, String> mapaCidades = {
    'Gaspar': 'SC',
    'Blumenau': 'SC',
    'Florianopolis': 'SC',
    'Curitiba': 'PR',
    'Cascavel': 'PR',
    'Foz do Iguaçu': 'PR',
    'Sao Paulo': 'SP',
    'Guarulhos': 'SP',
    'Campinas': 'SP',
    'Belo Horizonte': 'MG',
    'Juiz de Fora': 'MG',
    'Berlinda': 'MG',
  };

//primeiro preciso imprimir todos os estados


 
  final List<String> estados = [];

  // Passo por todas as cidades para coletar os estados
  for (final estado in mapaCidades.values) {
    // Se o estado ainda não está na lista, adiciona (evita repetidos)
    if (!estados.contains(estado)) {
      estados.add(estado);
    }
  }
  print('Estados: ${estados.join(' ; ')}\n');


  // ==========================================
  // segunda coisa que preciso fazer é printar as cidades de SC em ordem alfabética
  // ==========================================
  final List<String> cidadesSC = [];

  // Varremos o mapa pegando chave (cidade) e valor (estado)
  for (final entrada in mapaCidades.entries) {
    final cidade = entrada.key;
    final estado = entrada.value;

    // Se o estado for igual a 'SC', guardamos a cidade
    if (estado == 'SC') {
      cidadesSC.add(cidade);
    }
  }
  
  // Ordenamos a lista de SC
  cidadesSC.sort();
  print('Cidades de SC: ${cidadesSC.join(' ; ')}\n');



  //agora preciso ordenar todas as cidades (Cidade - Estado)
    final List<String> todasFormatadas = [];

  // Monto o formato "Cidade - Estado" para cada item do map
  for (final entrada in mapaCidades.entries) {
    final cidade = entrada.key;
    final estado = entrada.value;
    
    todasFormatadas.add('$cidade - $estado');
  }

  // Ordenamos todas em ordem alfabética
  todasFormatadas.sort();

  print('Todas as cidades em ordem alfabética:');
  // Uso um for básico para printar uma embaixo da outra
  for (final linha in todasFormatadas) {
    print(linha);
  }
}