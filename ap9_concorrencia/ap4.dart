void main() async {
  print('Iniciando o sistema');

  await buscarDados();

  print('Sistema finalizado');
}

Future<void>buscarDados() async{
  print ('Iniciando a conexão com o servidor');
  await Future.delayed(Duration(seconds: 1));


  print('Conexão estabelecida, buscando dados...');
  await Future.delayed(Duration(seconds: 1));

  print('Dados recebidos, processando informações...');
  await Future.delayed(Duration(seconds: 1));

  print('Dados carregados e processados com sucesso!');
}