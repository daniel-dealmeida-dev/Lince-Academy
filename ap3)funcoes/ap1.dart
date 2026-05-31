import 'dart:math';

void main() {
  final random = Random();

  // Inicializa as duas listas com 5 números aleatórios entre 0 e 100
  // Usei o nextInt(101) porque ele gera de 0 a 100 (o limite é exclusivo)
  List<int> lista1 = List.generate(5, (_) => random.nextInt(101));
  List<int> lista2 = List.generate(5, (_) => random.nextInt(101));

  // Imprime as listas iniciais chamando a função que criei
  imprimirLista(lista1);
  imprimirLista(lista2);
  print(''); // Só para dar uma quebra de linha no console e organizar a saída

  // como listas são um objeto podem ser usadas como tipo de um outro objeto, como por exemplo atributos ou  ate funções

  // Guarda o resultado da soma chamando a função principal
  List<int> listaResultado = somarListas(lista1, lista2);

  print(''); // Outro print vazio para separar a ação da lista final
  imprimirLista(listaResultado);
}

// Criei essa função para não ter que ficar repetindo o print com join toda hora
void imprimirLista(List<int> lista) {
  // Bônus Se a lista vier vazia por causa do erro de tamanho, ela barra aqui
  if (lista.isEmpty) {
    print('Lista vazia');
    return; // Esse return vazio serve para parar a função na hora e não rodar o print de baixo
  }

  // Lembrei do .join() que junta os elementos em uma String separando pelo que eu colocar no parâmetro
  print('Lista: ${lista.join(", ")}');
}

// Essa função recebe as duas listas, faz a soma índice por índice e mostra o processo
List<int> somarListas(List<int> l1, List<int> l2) {
  // Bônus Validação: se os tamanhos forem diferentes, quebra a regra e já devolve uma lista vazia
  if (l1.length != l2.length) {
    return [];
  }

  List<int> resultado = [];

  // Usei um for tradicional com índice 'i' porque preciso pegar a mesma posição nas duas listas ao mesmo tempo
  for (int i = 0; i < l1.length; i++) {
    int soma = l1[i] + l2[i];
    resultado.add(soma); // Adiciona o resultado da soma na nossa lista final

    // Mostra na tela a ação que está acontecendo exatamente nesse índice (ex: 3+15)
    print('${l1[i]}+${l2[i]}');
  }

  return resultado; // Devolve a lista prontinha com todas as somas
}
