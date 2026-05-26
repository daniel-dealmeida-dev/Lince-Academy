void main(){
  //final String finalNome1 = 'Daniel final';
  //const String constNome1 = 'Daniel const';

  //print(finalNome1);
  //print(constNome1);

      //OU

  // final finalNome2 = 'Daniel final';
  // const constNome2 = 'Daniel const';

  //print(finalNome2);
  //print(constNome2);

 // 2. FINAL (Constante ("variavel") de Tempo de Execução - Runtime)
  // O valor é definido quando o programa está rodando e, após estipulado, nunca mais muda.
  // Por isso, aceita receber o resultado de funções, buscas em APIs ou banco de dados.
  final valor = getValor();
  print(valor);


  // 3. CONST (Constante ("literal")de Tempo de Compilação - Compile-time)
  // O valor DEVE ser conhecido antes do programa rodar (enquanto o código é compilado).
  // Ele é "congelado" na memória e ajuda muito na performance do app (ex: componentes).

  // const valorConstErro = getValor(); // ERRO: Não dá para saber o valor da função antes de rodar o programa!
  
  const valorConst = 'Valor conhecido de antemão'; // Correto: Valor literal e fixo.
  print(valorConst);
}

// Uma arrow function simples que retorna uma String
String getValor() => "Valor retornado pela função getValor()";