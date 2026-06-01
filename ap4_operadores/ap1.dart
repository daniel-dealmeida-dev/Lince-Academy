void main() {
  // Criei duas listas separadas com os valores do enunciado para testar a função de forma organizada
  final anosBissextos = [2016, 1988, 2000];
  final anosNaoBissextos = [2100, 2300, 1993];

  print('--- Testando Anos Bissextos ---');
  // Varro a lista de bissextos para validar se a função está retornando true
  for (int ano in anosBissextos) {
    if (ehAnoBissexto(ano)) {
      print('O ano $ano eh bissexto');
    } else {
      print('O ano $ano nao eh bissexto');
    }
  }

  print('\n--- Testando Anos Não Bissextos ---');
  // Faço o mesmo laço aqui para garantir que os anos seculares não bissextos e ímpares passem na validação
  for (int ano in anosNaoBissextos) {
    if (ehAnoBissexto(ano)) {
      print('O ano $ano eh bissexto');
    } else {
      print('O ano $ano nao eh bissexto');
    }
  }
}

// Usei uma combinação de operadores lógicos e aritméticos para matar a validação em uma linha só.
// O operador '%' pega o resto da divisão. Se for 0, significa que o número é divisível.
bool ehAnoBissexto(int ano) {
  // A lógica aqui diz: o ano precisa ser divisível por 4 E (não ser divisível por 100 OU ser divisível por 400).
  // Usei os parênteses para garantir que os  operadores lógicos estão corrtetos'&&' e '||'
  return (ano % 4 == 0) && (ano % 100 != 0 || ano % 400 == 0);
}