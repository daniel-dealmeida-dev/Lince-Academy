import 'dart:math';

class Helpers {
  //conversões
  static double celciusParaFahrenheit(double c) => (c * 9 / 5) + 32;
  static double celciusParaKelvin(double c) => c + 273.15;
  static double grausParaRadianos(double g) => g * pi / 180;


  static double msParaKmh(double ms) => ms * 3.6;
  static double msParaMph(double ms) => ms * 2.23694;
  
  //formatações de datas
  static String obterNomemes(int mes) {
    const meses = {
      1: 'Janeiro',
      2: 'Fevereiro',
      3: 'Março',
      4: 'Abril',
      5: 'Maio',
      6: 'Junho',
      7: 'Julho',
      8: 'Agosto',
      9: 'Setembro',
      10: 'Outubro',
      11: 'Novembro',
      12: 'Dezembro'
    };
    return meses[mes] ?? 'Desconhecido';
  }

  //funcção com um regex pra salvar um TXT
  static String removerCodigoAnsi(String texto) {
    return texto.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '');
  }
}
