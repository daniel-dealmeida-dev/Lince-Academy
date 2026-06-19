import 'dart:convert';
import 'dart:io';

import 'package:atividade_final_dart/models/registro_climatico.dart';
import 'package:atividade_final_dart/services/processador_estatico.dart';
import 'package:atividade_final_dart/utils/mensagens.dart';
import 'package:path/path.dart' as p;

class MeteorologiaController {
  final ProcessadorEstatistico processador = ProcessadorEstatistico();

  Future<void> carregarDados() async {
    final inicio = DateTime.now();

    int arquivosProcessados = 0;
    int arquivosIgnorados = 0;
    int registrosLidos = 0;
    int registrosInvalidos = 0;

    final pasta = Directory(r'C:\clima\sensores');

    try {
      if (!await pasta.exists()) {
        Mensagem.erro(
          r'A pasta C:\clima\sensores não foi encontrada.',
        );
        return;
      }
    } catch (error) {
      Mensagem.erro(
        'Falha ao acessar a pasta: $error',
      );
      return;
    }

    await for (final arquivo in pasta.list()) {
      if (arquivo is! File ||
          !arquivo.path.toLowerCase().endsWith('.csv')) {
        continue;
      }

      final nomeArquivo = p.basename(arquivo.path);

      try {
        final partesNome =
            nomeArquivo.replaceAll('.csv', '').split('_');

        if (partesNome.length < 2) {
          Mensagem.alerta(
            'Arquivo "$nomeArquivo" ignorado: nome fora do padrão.',
          );
          arquivosIgnorados++;
          continue;
        }

        final uf = partesNome[0].toUpperCase();
        final ano = int.tryParse(partesNome[1].trim());

        if (ano == null) {
          Mensagem.alerta(
            'Arquivo "$nomeArquivo" ignorado: ano inválido.',
          );
          arquivosIgnorados++;
          continue;
        }

        arquivosProcessados++;

        Mensagem.info(
          'Processando arquivo $nomeArquivo',
        );

        final streamLinhas = arquivo
            .openRead()
            .transform(utf8.decoder)
            .transform(const LineSplitter());

        int numeroLinha = 0;

        await for (final linha in streamLinhas) {
          numeroLinha++;

          if (linha.trim().isEmpty ||
              linha.startsWith('Mês')) {
            continue;
          }

          registrosLidos++;

          final colunas = inlineSplit(linha); // linha.split(',')

          if (colunas.length < 8) {
            registrosInvalidos++;

            Mensagem.alerta(
              'Linha $numeroLinha do arquivo $nomeArquivo ignorada: quantidade de colunas inválida.',
            );

            continue;
          }

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
            registrosInvalidos++;

            Mensagem.alerta(
              'Linha $numeroLinha do arquivo $nomeArquivo ignorada por conter dados inválidos.',
            );
          }
        }
      } catch (e) {
        Mensagem.erro(
          'Erro ao processar o arquivo $nomeArquivo: $e',
        );
      }
    }

    final tempo = DateTime.now().difference(inicio);

    Mensagem.info('''
=================================
PROCESSAMENTO CONCLUÍDO
=================================

Arquivos processados: $arquivosProcessados
Arquivos ignorados: $arquivosIgnorados

Registros lidos: $registrosLidos
Registros inválidos: $registrosInvalidos

Tempo de execução: ${tempo.inMilliseconds} ms
''');
  }

  MetricasMensais? consultarRelatorioMensal(
    String uf,
    int ano,
    int mes,
  ) {
    return processador.obterMetricas(
      uf,
      ano,
      mes,
    );
  }
}

// Função auxiliar apenas para legibilidade do split interno
List<String> inlineSplit(String linha) => linha.split(',');