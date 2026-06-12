import 'dart:math';

void main() {
  final listaDeCompras = ListaDeCompras();

  print('--- 1. INCLUINDO ITENS NA LISTA ---');
  // Criando uma listinha
  listaDeCompras
  ..incluirItem(ItemMercado('Arroz 5kg', 2))
  ..incluirItem(ItemMercado('Feijão Preto', 3))
  ..incluirItem(ItemMercado('Leite Integral', 12))
  ..incluirItem(ItemMercado('Café Tradicional', 2));

  // Exibe o console inicial
  listaDeCompras
  ..exibirItensDesejados()
  ..mostrarProgresso();

  print('\n--- 2. SIMULANDO A COMPRA (Marcando status) ---');
  listaDeCompras
  ..marcarComoComprado('Arroz 5kg')
  ..marcarComoComprado('Feijão Preto')
  ..marcarComoSemEstoque('Café Tradicional');

  print('\n--- 3. STATUS DA LISTA APÓS A COMPRA ---');
  listaDeCompras
  ..exibirItensDesejados()
  ..mostrarProgresso();

  print('\n--- 4. TESTANDO ITEM ALEATÓRIO PENDENTE ---');
  listaDeCompras.escolherItemPendenteAleatorio();
}

enum StatusItem {
  desejado,
  comprado,
  semEstoque,
}

class ItemMercado {
  ItemMercado(this.nome, this.quantidade);

  final String nome;
  final int quantidade;
  
  // Todo item começa como desejado por padrão
  StatusItem status = StatusItem.desejado;
}

class ListaDeCompras {
  // A estrutura de lista que foi exigida pelo enunciado
  final List<ItemMercado> _itens = <ItemMercado>[];

  // Ação: Incluir novos itens desejados
  void incluirItem(ItemMercado item) {
    _itens.add(item);
    print('${item.nome} (${item.quantidade}x) adicionado à lista.');
  }

  // Separa os itens ja comprados dos itens desejados
  void marcarComoComprado(String nomeDoItem) {
    for (final item in _itens) {
      if (item.nome == nomeDoItem) {
        item.status = StatusItem.comprado;
        print('-> Item [ $nomeDoItem ] foi comprado.');
        return;
      }
    }
  }

  //  Separa os itens que nao havia estoque dos itens desejados
  void marcarComoSemEstoque(String nomeDoItem) {
    for (final item in _itens) {
      if (item.nome == nomeDoItem) {
        item.status = StatusItem.semEstoque;
        print('-> Item [ $nomeDoItem ] está em falta no estoque.');
        return;
      }
    }
  }

  //  Exibw no console os itens desejados, com as suas quantidades
  void exibirItensDesejados() {
    print('\nItens ainda desejados (Pendentes):');
    
    // .where() filtra a lista pegando apenas quem ainda tem o status desejado
    final desejados = _itens.where((item) => item.status == StatusItem.desejado).toList();

    if (desejados.isEmpty) {
      print('Nenhum item pendente!');
      return;
    }

    for (final item in desejados) {
      print('• ${item.nome} - Quantidade: ${item.quantidade}');
    }
  }

  void escolherItemPendenteAleatorio() {
    final desejados = _itens.where((item) => item.status == StatusItem.desejado).toList();

    if (desejados.isEmpty) {
      print('Não há itens pendentes para escolher.');
      return;
    }

    final random = Random();
    final itemAleatorio = desejados[random.nextInt(desejados.length)];
    print('Sugestão de item para pegar agora: ${itemAleatorio.nome}');
  }

  //  Mostra um indicador de progresso (ex.: "Progresso: 7/12")
  void mostrarProgresso() {
    // Conta quantos itens totais foram cadastrados no mercado
    final totalItens = _itens.length;
    
    // Conta quantos itens foram marcados como Comprados
    final comprados = _itens.where((item) => item.status == StatusItem.comprado).length;

    print('Progresso: $comprados/$totalItens');
  }
}