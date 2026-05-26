class Usuario {
  // Como os dados não vão mudar após criados, usei final em tudo
  final String nome;
  final String sobrenome;
  final int idade;
  final bool ativo;
  final double peso;
  final String? nacionalidade;

  // Construtor constante vai permitir que o objeto inteiro seja criado como const se os valores forem fixos
  const Usuario({
    // p this é a variavel de contexto, pro dart saber que o valor que eu quero passar pro nome é o nome que eu declarei lá em cima, e não uma nova variavel local, e o required é pra garantir que esses dados sejam passados obrigatoriamente na hora de criar a instancia da classe, evitando erros de dados faltando
    // O 'required' força a passagem dos dados obrigatórios, garantindo que os atributos final não-nulos recebam valor (quase um confia que no fim vai ter valor, mas o required é pra garantir que isso aconteça mesmo, evitando erros de dados faltando)
    required this.nome,
    required this.sobrenome,
    required this.idade,
    required this.ativo,
    required this.peso,
    this.nacionalidade, // Opcional, pode ser nulo
  });

  // O método toString() fala como o objeto será exibido quando eu finalmente der um print nele
  // passsando tudo isso para o toString() em formato de objeto (chave : valor) para facilitar a leitura e organização do output, e também usando o operador de coalescência nula para mostrar "Desconhecida" caso a nacionalidade seja nula
  String toString() {
    // operadores ternarios simples
    String statusIdade = (idade >= 18) ? "Maior de idade" : "Menor de idade";
    String statusAtivo = ativo ? "Ativo" : "Inativo";

    // o é usado para criar uma string multilinha, facilitando a formatação do output
    return '''
Nome completo: $nome $sobrenome
Idade: $idade ($statusIdade)
Situação: $statusAtivo
Peso: ${peso.toStringAsFixed(2)} kg
Nacionalidade: ${nacionalidade ?? "Desconhecida"}''';
  }
}

void main() {
  // 2. Instanciei a classe. Como os valores são conhecidos em tempo de compilação, posso usar const denovo aqui
  
  // novamente passando os dados em um const em formato de objeto (chave : valor))
  const usuario = Usuario(
    nome: "Daniel",
    sobrenome: "de Almeida",
    idade: 18,
    ativo: true,
    peso: 82.4,
    nacionalidade: null, // Testando o operador de coalescência nula (??)
  );

  // 3. Agora é só printar o objeto direto O Dart vai chama o toString() automaticamente por baixo
  print(usuario);
}