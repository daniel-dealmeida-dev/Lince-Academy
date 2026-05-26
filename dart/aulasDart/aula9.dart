void main() {
  // ==========================================
  // 1. FORMAS DE DECLARAR STRINGS
  // ==========================================

  // Declaração padrão com aspas duplas
  String nome = "Daniel";
  print(nome); // Printa: Daniel

  // Declaração padrão com aspas simples (Mais usada e recomendada na comunidade Dart)
  String nome2 = 'Daniel';
  print(nome2); // Printa: Daniel

  // Combinando aspas: Aspas duplas dentro de aspas simples aparecem como texto literal
  String nome3 = 'Daniel "Dani"';
  print(nome3); // Printa: Daniel "Dani"

  // Strings multilinha (3 aspas simples): Mantém as quebras de linha e espaçamentos reais do código
  String nome4 = '''Daniel
  Almeida''';
  print(nome4); 
  /* Printa:
  Daniel
    Almeida
  */

  // Strings multilinha com 3 aspas duplas: Funciona exatamente igual às 3 aspas simples
  String nome5 = """ Daniel
  Almeida """;
  print(nome5);

  // 2. CONCATENAÇÃO, ESCAPES E SÍMBOLOS
  // ==========================================

  // Concatenação tradicional usando o operador "+"
  String string1 = 'Olá, ';
  print(string1 + nome); // Printa: Olá, Daniel

  // O Dart trata a barra normal (/) como texto comum. A barra de escape é a invertida (\)
  String string2 = 'm/undo!';
  print(string2); // Printa: m/undo!

  // Aspas duplas literais dentro de aspas simples
  String string3 = 'o meu nome é "Daniel" ';
  print(string3); // Printa: o meu nome é "Daniel" 

  // Caractere de Escape (\'): Permite usar aspas simples dentro de uma string de aspas simples sem fechar ela
  String string4 = 'o meu nome é \'Daniel\' ';
  print(string4); // Printa: o meu nome é 'Daniel' 

  // Caractere de Escape (\$): Anula o poder do "$" e faz ele ser impresso como texto puro
  String string5 = 'o meu nome é \$Daniel ';
  print(string5); // Printa: o meu nome é $Daniel 

  // Aqui o escape impede que o Dart interprete "$nome" como a variável. Vira texto puro
  String string6 = 'o meu nome é \$nome ';
  print(string6); // Printa: o meu nome é $nome 

  // Outro texto com barra comum tratada normalmente
  String string7 = 'o meu nome é "D/aniel" ';
  print(string7); // Printa: o meu nome é "D/aniel" 

  // Interpolação com Expressão ${}: Usada quando precisamos rodar métodos ou acessar propriedades (ex: .toUpperCase())
  String string8 = 'o meu nome é ${nome.toUpperCase()} ';
  print(string8); // Printa: o meu nome é DANIEL 


  // 3. TRUQUES DE CONCATENAÇÃO
  // ==========================================

  // Juntando duas strings literais com o operador "+"
  String concat1 = 'Olá, ' + 'daniel!';
  print(concat1); // Printa: Olá, daniel!

  // Concatenação Implícita: No Dart, strings literais vizinhas na mesma linha se juntam sem precisar do "+"
  String concat2 = 'Olá, ' 'daniel!';
  print(concat2); // Printa: Olá, daniel!

  // Concatenação Implícita Multilinha: Também funciona quebrando a linha, ótimo para textos longos
  String concat3 = 'Olá,'
  "daniel!";
  print(concat3); // Printa: Olá,daniel!

  // Concatenação em cadeia com "+"
  String concat4 = 'Olá, ' + 'daniel!' + ' Tudo bem?';
  print(concat4); // Printa: Olá, daniel! Tudo bem?

  // Juntando uma string normal com a string multilinha criada lá em cima
  String concat = concat1 + nome4;
  print(concat);


  // 4. INTERPOLAÇÃO DE VARIÁVEIS 
  // ==========================================

  // Interpolação Simples ($): Forma mais limpa e performática do Dart para injetar variáveis em textos (melhor que usar "+")
  String interpolacao1 = 'Olá, $nome!';
  print(interpolacao1); // Printa: Olá, Daniel!

  // Interpolação Complexa (${}): Necessária aqui para acessar o tamanho da string (.length)
  String interpolacao2 = 'O nome tem ${nome.length} letras.'; 
  print(interpolacao2); // Printa: O nome tem 6 letras.
}