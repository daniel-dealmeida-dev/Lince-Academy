void validarNumeroPar(String entrada) {
  try {
    // tenta converter o texto do terminal para um número inteiro
    int numero = int.parse(entrada);

    // se o resto da divisão por 2 não for 0, o número é ímpar
    if (numero % 2 != 0) {
      // Lanço a exceção com a mensagem exata pedida
      throw Exception('Entrada inválida. Insira apenas números pares.');
    }

    // se passou pelo if sem lançar a exceção, o número é par
    print('Entrada correta, você inseriu um número par.');

  } on FormatException {
    // Trata o caso de digitarem letras em vez de números
    print('Exception: Entrada inválida. Você deve digitar um número inteiro.');
  } catch (e) {
    // Captura a Exception que lançou lá em cima
    print(e);
  }
}

void main(List<String> args) {
  // Se esquecer de passar o parâmetro no terminal, avisa o usuário
  if (args.isEmpty) {
    print('Por favor, passe um número. Exemplo: dart ap2.dart 4');
    return;
  }
  // Pega o valor digitado no terminal e manda para a função
  validarNumeroPar(args[0]);
}