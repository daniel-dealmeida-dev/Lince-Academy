
void main(){
  // Declaração dos dados
  final String nome = "Daniel";
  final String sobrenome = "de Almeida";
  final int idade = 18;
  final bool ativo = true;
  final double peso = 82.4;

  // Verificação das variaveis usando ternário 
  String? nacionalidade = null;
  String statusIdade = (idade >= 18) ? "Maior de idade" : "Menor de idade";
  String statusAtivo = ativo ? "Ativo" : "Inativo";


  print("Nome completo: $nome $sobrenome");
  print("Idade: $idade ($statusIdade)");
  print("Situação: $statusAtivo");
  //o método to StringAsFixed() é usado pra para formatar um number pra String, limitando o número de casas decimais pelo parametro que no caso foi (2) ele funciona de forma similar ao toFixed() e ao Template literal do typescript
  print("Peso: ${peso.toStringAsFixed(2)} kg");

  // Verificação da nacionalidade usando o operador de coalescência nula (E descobri que ele funciona igual no typescript)
  print("Nacionalidade: ${nacionalidade ?? "Desconhecida"}");
}


