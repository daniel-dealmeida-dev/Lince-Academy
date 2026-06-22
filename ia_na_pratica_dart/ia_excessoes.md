# Registro de Estudos: Tratamento de Exceções em Dart
**Curso:** Lince Tech Academy – Usando IA como apoio
**Arquivo:** ia_excecoes.md

Este documento registra a interação com a inteligência artificial para explorar os conceitos de tratamento de erros, exceções, blocos try/catch/finally e o uso de asserts na linguagem Dart.

---

## 1. Perguntas Teóricas e Práticas

### • Qual a diferença entre um erro e uma exceção em Dart?
* Erro (Error): Representa falhas graves e quebras de contrato no código que o programador deveria ter evitado. Geralmente indicam falhas de lógica ou problemas de sistema (ex: OutOfMemoryError ou ArgumentError). Eles não devem ser capturados (catch), mas sim corrigidos no código.
* Exceção (Exception): Representa condições adversas, mas previsíveis, que acontecem durante a execução normal do app (ex: um servidor que caiu ou um arquivo não encontrado). Devem ser capturadas e tratadas para o app não crashar na mão do usuário.

### • Em quais situações devo esperar encontrar um erro, e em quais devo esperar uma exceção?
* Erros: Espere encontrá-los quando houver bugs de desenvolvimento, como tentar acessar um índice que não existe em uma lista (RangeError) ou passar um argumento inválido para uma função.
* Exceções: Espere encontrá-las em operações que dependem de fatores externos fora do controle do seu código, como chamadas de API (rede fora do ar), leitura de arquivos do celular ou conversão de inputs digitados pelo usuário (FormatException).

### • O que fazem os blocos 'try', 'catch' e 'finally' em Dart?
* try: Monitora um bloco de código onde existe o risco de algo dar errado e estourar um problema.
* catch: Captura o problema que aconteceu dentro do 'try', dando acesso ao objeto do erro/exceção para que você possa tomar uma ação corretiva.
* finally: Um bloco que SEMPRE será executado, não importa se o código rodou perfeitamente ou se aconteceu a maior quebra do mundo dentro do 'try'.

### • Como posso capturar diferentes tipos de exceções usando 'catch'?
O Dart oferece a palavra-chave 'on' para especificar qual tipo de exceção você quer tratar. Isso ajuda a dar respostas específicas para problemas diferentes:
try {
  // Código de risco
} on FormatException {
  print('O texto digitado é inválido.');
} on NetworkException {
  print('Sem conexão com a internet.');
} catch (e) {
  print('Outro erro genérico aconteceu: $e');
}

### • Em quais situações é útil usar o bloco 'finally'?
É extremamente útil para rotinas de limpeza e liberação de recursos do sistema. Por exemplo: fechar a conexão com um banco de dados, fechar um arquivo que foi aberto para leitura, ou sumir com um ícone de carregamento (loading) da tela do celular, garantindo que o carregamento suma dando certo ou dando errado.

### • Por que eu precisaria lançar uma exceção em meu código?
Você lança uma exceção (usando a palavra-chave 'throw') quando o seu código encontra uma situação de negócio inválida que impede que a função continue rodando. Por exemplo, se uma função sacar() recebe um valor maior do que o saldo da conta, você lança um throw para avisar quem chamou a função que a operação falhou.

### • Como posso personalizar mensagens de erro ao lançar exceções?
Você pode criar uma classe própria que implementa a classe Exception do Dart ou simplesmente lançar strings e objetos customizados.
Exemplo conceitual:
class SaldoInsuficienteException implements Exception {
  final String mensagem;
  SaldoInsuficienteException(this.mensagem);
}
throw SaldoInsuficienteException('Você não tem saldo para este saque.');

### • Quais são as melhores práticas para lançar exceções em Dart?
1. Nunca engula exceções (dar um catch e deixar o bloco vazio sem fazer nada).
2. Seja específico: prefira criar ou usar exceções exatas em vez de dar 'throw Exception()' genérico.
3. Se capturar algo que não sabe resolver, use a palavra-chave 'rethrow' para repassar a exceção para a camada de cima tratar.

### • Qual a diferença entre usar 'assert' e lançar uma exceção para verificar condições?
* assert: É uma ferramenta exclusiva de desenvolvimento. Ela serve para testar hipóteses e garantir que o programador não cometeu erros de lógica durante os testes. Se a condição falhar, o app fecha na hora. Em modo de produção (quando o app vai para as lojas), o assert é completamente ignorado e removido do código.
* Exceção (throw): Funciona tanto em desenvolvimento quanto em produção. Serve para tratar fluxos que podem falhar no mundo real, na mão do cliente final.

### • Em quais situações o 'assert' é mais útil durante o desenvolvimento?
Ele é perfeito para validar contratos de desenvolvimento e checar parâmetros que nunca deveriam vir errados se o código estivesse bem escrito. Por exemplo: garantir que um ID recebido por parâmetro não seja nulo ou que a URL de testes da API comece obrigatoriamente com 'https://'.

---

## 2. Exemplos Conceituais e Organização

### Como os erros e exceções afetam a execução do programa
* Sem tratamento: Se uma linha de código quebra por uma FormatException (ex: tentar converter a palavra 'abc' em número), o Dart interrompe a execução do programa imediatamente naquele ponto. Todo o código que viria abaixo é descartado e o usuário vê o app fechar ou travar.
* Com tratamento (try-catch): O fluxo do erro é interceptado. O programa para o bloco 'try', pula direto para o bloco 'catch' correspondente, executa o tratamento (como mostrar um aviso amigável na tela) e continua rodando as linhas de código subsequentes normalmente.

### Como organizar minhas exceções no projeto
A boa prática de arquitetura em projetos de tecnologia dita que as exceções devem ser centralizadas e categorizadas:
1. Crie uma pasta chamada 'errors' ou 'exceptions' dentro do seu projeto.
2. Crie arquivos específicos para cada domínio do app (ex: auth_exceptions.dart, database_exceptions.dart).
3. Faça com que suas classes customizadas herdem ou implementem as classes base do Dart, mantendo um padrão limpo de mensagens.

---

## 3. Minhas Observações e Aprendizados

* Erro vs Exceção: Ficou muito clara a diferença. Erro é culpa do desenvolvedor (falha de lógica), enquanto Exceção faz parte do ecossistema imprevisível do mundo real (falhas de rede, inputs do usuário).
* O poder do Finally: Entendi que o 'finally' é indispensável para evitar vazamentos de memória (memory leaks), pois garante o encerramento de conexões abertas independentemente do sucesso do fluxo principal.
* Assert inteligente: O fato de o 'assert' ser removido em produção é genial, pois permite encher o código de checagens rígidas de segurança durante a criação sem perder performance ou travar o app do usuário final mais tarde.