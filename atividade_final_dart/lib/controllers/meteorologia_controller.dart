import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'package:atividade_final_dart/models/registro_climatico.dart';
import 'package:atividade_final_dart/services/processador_estatico.dart';

class MeteorologiaController {
  final ProcessadorEstatistico processador = ProcessadorEstatistico();

  Future<void> carregarDados() async {
    final pasta = Directory('C:\\clima\\sensores');

    try {
      if (!await pasta.exists()) {
        print('Erro Critico: A pasta C:\\clima\\sensores não foi encontrada no sistema');
        return;
      }
    } catch (error) {
      print('Erro ao acessar a pasta: $error');
      return;
    }

    await for (var arquivo in pasta.list()) {
      if (arquivo is File && arquivo.path.toLowerCase().endsWith('.csv')) {
        String nomeArquivo = p.basename(arquivo.path);

        try {
          List<String> partesNome = nomeArquivo.replaceAll('.csv', '').split('_');

          if (partesNome.length < 2) {
            print('Alerta: o arquivo "$nomeArquivo" está fora do padrão de nomenclatura');
            continue;
          }
          
          String uf = partesNome[0].toUpperCase();
          
          int? ano = int.tryParse(partesNome[1].trim());
          if (ano == null) continue;

          final streamLinhas = arquivo
              .openRead()
              .transform(utf8.decoder)
              .transform(const LineSplitter());

          int i = 0;

          await for (String linha in streamLinhas) {
            i++;
            
            if (linha.startsWith('Mês') || linha.trim().isEmpty) continue;

            List<String> colunas = linha.split(',');

            if (colunas.length >= 8) {
              try {
                final registro = RegistroClimatico.fromCsv(
                  linhaCsv: linha,
                  uf: uf,
                  ano: ano,
                );

                processador.registrarDadosNoMes(
                  uf: registro.uf,
                  ano: registro.dataHora.year,
                  mes: registro.dataHora.month,
                  temp: registro.temperatura,
                  umidade: registro.umidade, 
                  vento: registro.direcaoVento,
                );
              } catch (e) {
                print('Alerta: Linha $i do arquivo $nomeArquivo ignorada por conter dados inválidos.');
              }
            }
          }
        } catch (e) {
          print('Erro ao processar o arquivo $nomeArquivo: $e');
        }
      }
    }
  }

  MetricasMensais? consultarRelatorioMensal(String uf, int ano, int mes) {
    return processador.obterMetricas(uf, ano, mes);
  }
}