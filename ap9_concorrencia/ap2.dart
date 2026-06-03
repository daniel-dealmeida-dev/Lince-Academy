Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  print('Baixando imagens...');  
  
  //assincrono
  await baixarImagens(urls);
  
  print('Download concluído!');
}

Future<void> baixarImagens(List<String> urls) async {
  // uma variável simples para saber qual imagem está baixando
  int contador = 1;

  // Um for para rodar 3 vezes, uma para cada URL.
  for (String url in urls) {
    // Espera 1 segundo simulando o download da imagem atual.
    await Future.delayed(Duration(seconds: 1));
    
    // ostra a mensagem na tela usando o contador
    print('Imagem <imagem$contador> baixada com sucesso!');
    
    // Soma 1 para a próxima imagem
    contador++;
  }
}