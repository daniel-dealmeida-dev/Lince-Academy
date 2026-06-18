class MetricasMensais {
  double tempSoma = 0.0;
  int tempQtd = 0;
  double tempMax = -999.0;
  double tempMin = 999.0;

  double umiSoma = 0.0;
  int umiQtd = 0;
  double umiMax = -999.0;
  double umiMin = 999.0;

  // map pra contar a frequência das direções do vento com moda
  final Map<double, int> frequenciaVento = {};

  void registrarLeitura(double temp, double umidade, double direcaoVento){
    //Temperatura
    tempSoma += temp;
    tempQtd++;

    if (temp > tempMax) tempMax = temp;
    if (temp < tempMin) tempMin = temp;

    //Umidade
    umiSoma += umidade;
    umiQtd++;
    if(umidade > umiMax) umiMax = umidade;
    if(umidade < umiMin) umiMin = umidade;


    //vento
    frequenciaVento.update(direcaoVento,
    (qtd)=> qtd + 1, 
    ifAbsent: () => 1);
  }

  double  calcularTempMedia(){
    return tempQtd > 0 ? tempSoma / tempQtd : 0.0;
  }

  double calcularUmiMedia(){
    return umiQtd > 0 ? umiSoma / umiQtd : 0.0;
  }

  double calcularModaVento(){
    double direcaoMaisFrequente = 0.0;
    int maiorOcorrencia = 0;
  
    frequenciaVento.forEach((grau, qtd){
      if(qtd > maiorOcorrencia){
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
    required double temp,
    required double vento,
  }){
    _dados.putIfAbsent(uf, ()=>{});
    final mapaDoEstado = _dados[uf]!;

    mapaDoEstado.putIfAbsent(ano, ()=>{});
    final mapaDoAno = mapaDoEstado[ano]!;


    mapaDoAno.putIfAbsent(mes, ()=> MetricasMensais());
    final metricasDoMes = mapaDoAno[mes]!;

    metricasDoMes.registrarLeitura(temp,  vento);
    }

    //TODO - terminar implementação do metodo estatistico
    MetricasMensais? obterMetricas(String uf, int ano, int mes){

    }

}