import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  // Lista com todas as formas para o comparador avaliar
  final formas = <FormaGeometrica>[
    Circulo('Circulo A', 3),
    Circulo('Circulo B', 8),
    Retangulo('Retângulo A', 4, 3),
    Retangulo('Retângulo B', 19, 11),
    Quadrado('Quadrado A', 5),
    TrianguloEquilatero('Triângulo Equilátero A', 6),   
    TrianguloRetangulo('Triângulo Retângulo A', 3, 4),   
    PentagonoRegular('Pentágono Regular A', 5),           
    HexagonoRegular('Hexágono Regular A', 4),            
  ];

  print('--- RESULTADOS ---');

  final maiorArea = comparador.maiorArea(formas);
  final maiorPerimetro = comparador.maiorPerimetro(formas);

  print('A maior area e ${maiorArea.area.toStringAsFixed(2)} e pertence a ${maiorArea.nome}');
  print('O maior perímetro e ${maiorPerimetro.perimetro.toStringAsFixed(2)} e pertence a ${maiorPerimetro.nome}');
}


abstract class FormaGeometrica {
  FormaGeometrica(this.nome);
  final String nome;

  double get area;
  double get perimetro;
}

// Utilizar polimorfismo nas classes filhas abaixo
class Circulo extends FormaGeometrica {
  Circulo(super.nome, this.raio);
  final double raio;

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

class Retangulo extends FormaGeometrica {
  Retangulo(super.nome, this.altura, this.largura);
  final double largura;
  final double altura;

  @override
  double get area => altura * largura;

  @override
  double get perimetro => (altura * 2) + (largura * 2);
}

class Quadrado extends FormaGeometrica {
  Quadrado(super.nome, this.lado);
  final double lado;

  @override
  double get area => lado * lado;

  @override
  double get perimetro => lado * 4;
}

class TrianguloEquilatero extends FormaGeometrica {
  TrianguloEquilatero(super.nome, this.lado);
  final double lado;

  @override
  double get area => (math.pow(lado, 2) * math.sqrt(3)) / 4;

  @override
  double get perimetro => lado * 3;
}

class TrianguloRetangulo extends FormaGeometrica {
  TrianguloRetangulo(super.nome, this.base, this.altura);
  final double base;
  final double altura;

  @override
  double get area => (base * altura) / 2;

  @override
  double get perimetro {
    final hipotenusa = math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
    return base + altura + hipotenusa;
  }
}

class PentagonoRegular extends FormaGeometrica {
  PentagonoRegular(super.nome, this.lado);
  final double lado;

  @override
  double get area {
    final anguloRad = 36 * (math.pi / 180);
    return (5 * math.pow(lado, 2)) / (4 * math.tan(anguloRad));
  }

  @override
  double get perimetro => lado * 5;
}

class HexagonoRegular extends FormaGeometrica {
  HexagonoRegular(super.nome, this.lado);
  final double lado;

  @override
  double get area => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  @override
  double get perimetro => lado * 6;
}

class ComparadorFormasGeometricas {
  
  // Método apenas para area
  FormaGeometrica maiorArea(List<FormaGeometrica> formas) {
    FormaGeometrica campea = formas.first;
    for (final forma in formas) {
      if (forma.area > campea.area) {
        campea = forma;
      }
    }
    return campea;
  }

  // Método apenas para perímetro
  FormaGeometrica maiorPerimetro(List<FormaGeometrica> formas) {
    FormaGeometrica campea = formas.first;
    for (final forma in formas) {
      if (forma.perimetro > campea.perimetro) {
        campea = forma;
      }
    }
    return campea;
  }
}