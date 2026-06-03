void main() async {
  print('Iniciando lançamento');

  // todo: implementar contagem regressiva
  const int segundos = 10;

  await ContagemRegressiva(segundos);

  print('Foguete lançado!');
}

Future<void> ContagemRegressiva(int segundos) async {
  //aprendi essa forma de definir os parametros do for, sem a inicialização, porque o valor já é passado como argumento da função
  for (; segundos > 0; segundos--) {
    print(segundos);
    await Future.delayed(Duration(seconds: 1));
  }
}
