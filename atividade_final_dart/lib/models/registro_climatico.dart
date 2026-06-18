class RegistroClimatico {
  final String uf;
  final DateTime dataHora;
  final double temperatura;
  final double velocidadeVento;
  final double direcaoVento;

  RegistroClimatico({
    required this.uf,
    required this.dataHora,
    required this.temperatura,
    required this.velocidadeVento,
    required this.direcaoVento,
  });

  // Esse método recebe a linha bruta, limpa, converte e devolve o objeto pronto
  factory RegistroClimatico.fromCsv({
    required String linhaCsv,
    required String uf,
    required int ano,
  }) {
    final colunas = linhaCsv.split(',');

    // Faz as conversões aqui dentro de forma isolada
    int mes = int.parse(colunas[0].trim());
    int dia = int.parse(colunas[1].trim());
    int hora = int.parse(colunas[2].trim());

    return RegistroClimatico(
      uf: uf,
      dataHora: DateTime(ano, mes, dia, hora),
      temperatura: double.parse(colunas[3].trim()),
      velocidadeVento: double.parse(colunas[6].trim()),
      direcaoVento: double.parse(colunas[7].trim()),
    );
  }
}