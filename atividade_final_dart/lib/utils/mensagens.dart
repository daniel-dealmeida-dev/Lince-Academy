import 'package:ansicolor/ansicolor.dart';

class Mensagem {
  static final _azul = AnsiPen()..blue();
  static final _amarelo = AnsiPen()..yellow();
  static final _vermelho = AnsiPen()..red();

  static void info(String texto) {
    print(_azul('[INFO] $texto'));
  }

  static void alerta(String texto) {
    print(_amarelo('[ALERTA] $texto'));
  }

  static void erro(String texto) {
    print(_vermelho('[ERRO] $texto'));
  }
}