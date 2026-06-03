//vou usar uma coisa chamada DateTime, uma classe pensada pra lidar com datas, horas e coisas do tipo. O construtor usa ano, mês e dia, nessa ordem.



// Primeiro: fnção para formatar a data 
String formatarDataManual(DateTime data) {
  String diaTexto = "";
  String mesTexto = "";

  
  if (data.day < 10) {
    diaTexto = "0${data.day}";
  } 
  if(data.day >= 10){ 
    diaTexto = "${data.day}";
  }

  // Se o mês for menor que 10, bota o zero na frente
  if (data.month < 10) {
    mesTexto = "0${data.month}";
  } 
  if(data.month >= 10){
    mesTexto = "${data.month}";
  }

  // juntar tudo no formato dd/MM/yyyy 
  return "$diaTexto/$mesTexto/${data.year}";
}

// Segundo: Função que calcula a soma pulando finais de semana
DateTime somarDiasUteis(DateTime dataInicial, int diasParaSomar) {
  DateTime dataCalculada = dataInicial;
  int diasUteisContados = 0;

  // Enquanto não contarmos 18 dias úteis...
  while (diasUteisContados < diasParaSomar) {
    // Avança 1 dia corrido no calendário
    dataCalculada = dataCalculada.add(Duration(days: 1));

    //  6 é Sábado e 7 é Domingo então
    // Só aumento o contador se for menor ou igual a 5 Segunda a Sexta
    if (dataCalculada.weekday <= 5) {
      diasUteisContados++;
    }
  }

  return dataCalculada;
}

void main(){
  DateTime dataHoje = DateTime(2022,9, 5);

  DateTime dataCalculada = somarDiasUteis(dataHoje, 18);

 print('Data atual: ${formatarDataManual(dataHoje)}');
  print('Data calculada: ${formatarDataManual(dataCalculada)}');
}