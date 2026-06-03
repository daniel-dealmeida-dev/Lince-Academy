import 'dart:math';

void main() {
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];

  for (double raio in raios) {
    final double area = pi * pow(raio, 2);
    final double perimetro = 2 * pi * raio;
    
    final String areaFormatada = area.toStringAsFixed(2);
    final String perimetroFormatado = perimetro.toStringAsFixed(2);
    
print('Raio: ${raio.toStringAsFixed(0)}, area: $areaFormatada, perímetro: $perimetroFormatado.');}
}