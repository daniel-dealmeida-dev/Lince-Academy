void main() {
  // const pros valores completamente estaticos, ou seja, que não vão mudar em tempo de execução. O valor deve ser conhecido em tempo de compilação.
  const numero1 = 10;
  const numero2 = 20;
  const numero3 = 30;
  const numero4 = 40;
  // final para valores que são definidos apenas uma vez, mas que podem ser calculados em tempo de execução. O valor é atribuído na primeira vez que é acessado.
  final media = (numero1 + numero2 + numero3 + numero4) / 4;

  //  E novamente usei o método toStringAsFixed() para limitar o número de casas decimais a 1, e também usei a interpolação de string para mostrar os números e a média formatados.
  print("A media entre [ ${numero1.toStringAsFixed(1)} , ${numero2.toStringAsFixed(1)} , ${numero3.toStringAsFixed(1)} , ${numero4.toStringAsFixed(1)} ] = ${media.toStringAsFixed(1)}");
}