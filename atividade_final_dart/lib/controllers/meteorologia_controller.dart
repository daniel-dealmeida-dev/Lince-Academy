import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:atividade_final_dart/models/registro_climatico.dart';

class MeteorologiaController {
  final List<RegistroClimatico> todosOsRegistros = [];

  Future<void> carregarDados() async {
    final pasta = Directory('C:\\clima\\sensores');

    try {
      if (!await pasta.exists()) {
        print(
            'Erro Critico: A pasta C:\\clima\\sensores não foi encontrada no sistema');
        return;
      }
    } catch (error) {
      print('Erro ao acessar a pasta: $error');
      return;
    }

    final entidades = pasta.listSync();

    for (var arquivo in entidades) {
      if (arquivo is File) {
        String nomeArquivo = p.basename(arquivo.path);

        try {
          // sempre que achar o .csv ele substitui por vazio pra não dar erro.
          List<String> partesNome = nomeArquivo.replaceAll('.csv', '').split(
              '_'); // sempre que tem um _ ele divide como em um array pra verificar depois

          if (partesNome.length < 2) {
            print(
                'Alerta: o arquivo "$nomeArquivo" está fora do padrão de nomenclatura');
            continue;
          }
          String uf = partesNome[0].toUpperCase();
          int ano = int.parse(partesNome[1].trim());

          List<String> linhas = await arquivo.readAsLines();

          for (int i = 0; i < linhas.length; i++) {
            String linha = linhas[i];

            if (linha.startsWith('Mês') || linha.trim().isEmpty) continue;

            List<String> colunas = linha.split(',');

            if (colunas.length >= 8) {
              try {
                todosOsRegistros.add(
                  RegistroClimatico.fromCsv(
                    linhaCsv: linha,
                    uf: uf,
                    ano: ano,
                  ),
                );
              } catch (e) {
                print(
                    'Alerta: Linha $i do arquivo $nomeArquivo ignorada por conter dados inválidos.');
              }
            }
          }
        } catch (e) {
          print('Erro ao processar o arquivo $nomeArquivo: $e');
        }
      }
    }
  }
}
