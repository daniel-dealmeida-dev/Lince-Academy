class RegistroClimatico {
  final String uf;
  final String ano;
  final String mes;
  final String dia;
  final String hora;

  final double temperatura;
  final double velocidadeVento;
  final double direcaoVento;

  RegistroClimatico({
    required this.uf,
    required this.ano,
    required this.mes,
    required this.dia,
    required this.hora,
    required this.temperatura,
    required this.velocidadeVento,
    required this.direcaoVento,
  });
}
