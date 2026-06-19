class MetricasMensais {
  double tempSoma = 0.0;
  int tempQtd = 0;
  double tempMax = double.negativeInfinity;
  double tempMin = double.infinity;

  double umiSoma = 0.0;
  int umiQtd = 0;
  double umiMax = double.negativeInfinity;
  double umiMin = double.infinity;

  // Frequência das direções do vento
  final Map<double, int> frequenciaVento = {};

  void registrarLeitura(
    double temp,
    double umidade,
    double vento,
  ) {
    // Temperatura
    tempSoma += temp;
    tempQtd++;

    if (temp > tempMax) tempMax = temp;
    if (temp < tempMin) tempMin = temp;

    // Umidade
    umiSoma += umidade;
    umiQtd++;

    if (umidade > umiMax) umiMax = umidade;
    if (umidade < umiMin) umiMin = umidade;

    // Vento
    frequenciaVento.update(
      vento,
      (qtd) => qtd + 1,
      ifAbsent: () => 1,
    );
  }

  double calcularTempMedia() {
    return tempQtd > 0 ? tempSoma / tempQtd : 0.0;
  }

  double calcularUmiMedia() {
    return umiQtd > 0 ? umiSoma / umiQtd : 0.0;
  }

  double calcularModaVento() {
    double direcaoMaisFrequente = 0.0;
    int maiorOcorrencia = 0;

    frequenciaVento.forEach((grau, qtd) {
      if (qtd > maiorOcorrencia) {
        maiorOcorrencia = qtd;
        direcaoMaisFrequente = grau;
      }
    });

    return direcaoMaisFrequente;
  }
}

class ProcessadorEstatistico {
  final Map<String, Map<int, Map<int, MetricasMensais>>> _dados = {};

  void registrarDadosNoMes({
    required String uf,
    required int ano,
    required int mes,
    required double umidade,
    required double temp,
    required double vento,
  }) {
    uf = uf.toUpperCase();

    _dados.putIfAbsent(uf, () => {});
    final mapaDoEstado = _dados[uf]!;

    mapaDoEstado.putIfAbsent(ano, () => {});
    final mapaDoAno = mapaDoEstado[ano]!;

    mapaDoAno.putIfAbsent(mes, () => MetricasMensais());
    final metricasDoMes = mapaDoAno[mes]!;

    metricasDoMes.registrarLeitura(
      temp,
      umidade,
      vento,
    );
  }

  MetricasMensais? obterMetricas(
    String uf,
    int ano,
    int mes,
  ) {
    return _dados[uf.toUpperCase()]?[ano]?[mes];
  }
}