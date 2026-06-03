void main() async{
  final future = Future.value(5);
  future 
  .then((value) => value + value).then((value)=> print("O valor é $value")) //agenda o callback para ser executado quando o valor estiver disponível
  //.then ((value)=> print("O valor é $value")) //agenda o callback para ser executado quando o valor estiver disponível
  .catchError((value) => print("Ocorreu um erro: $value")) //agenda o callback para ser executado se ocorrer um erro
  .whenComplete(()=> print('Completou a leitura do arquivo'));  //agenda o callback para ser executado quando a operação for concluída, seja com sucesso ou com erro
  //final result = await future; //espera o valor ser resolvido e atribui a result
 // print("O valor é $result");


}