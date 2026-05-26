void main() {
  // 1. Inferred Type (var)
  // O Dart adivinha o tipo pelo primeiro valor e TRANCA nele.
  // var nome = 'Daniel'; 
  // nome = 123; // ERRO: Não aceita mudar o tipo depois de definido.


  // 2. Type Object (A Superclasse)
  // Aceita qualquer valor por ser a base de tudo, mas limita o acesso.
  // Object nome = 'Daniel'; 
  // nome = 123; // Aceita mudar o tipo, mas bloqueia métodos específicos (ex: .toUpperCase()).


  // 3. Dynamic Type ("Sem Regras")
  // Permite mudar de tipo e aceita qualquer método, mas desliga os alertas do compilador.
  // dynamic nome = 'Daniel'; 
  // nome = 123; // Permite a troca, mas se tentar chamar métodos de String agora, quebra em tempo de execução.

  String nome = 'Daniel'; 
  
  print('Ola, $nome!');
}