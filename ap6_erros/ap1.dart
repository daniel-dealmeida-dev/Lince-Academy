void converterParaInteiro(String entrada) {
  try {
    // Tenta converter o que veio do terminal para inteiro
    int numero = int.parse(entrada);
    print('Numero digitado: $numero');
  } catch (e) {
    // Se digitarem letras ou se o terminal vier vazio não passaa
    print('Entrada invalida. Digite apenas números inteiros.');
  }
}

// Coloquei um List<String> args dentro do main para capturar o que for digitado
void main(List<String> args) {
  // Se esquecer de passar o número no terminal, ja avisa
  if (args.isEmpty) {
    print('Por favor, passe um número. Exemplo: dart ap1.dart 50');
    return;
  }

  // args[0] pega a primeira palavra/número que for digitado depois do nome do arquivo
  String entradaDoTerminal = args[0];
  
  converterParaInteiro(entradaDoTerminal);
}