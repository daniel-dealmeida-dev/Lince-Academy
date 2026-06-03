// Primeiro: Função para contar palavras
int contarPalavras(String texto) {
  return texto.split(' ').length;//só quero saber os espaços então split é suficiente
}

// Segundo: Função para contar frases
int contarFrases(String texto) {
  return texto.split('.').length - 1; //Aqui quero os ponto, tiro 1 por conta que ele conta o ponto final do parágrafo como uma frase ou espaço vazio.
}

// Terceiro: Função para contar as vogais
int contarVogais(String texto) {
  int contador = 0;
  List<String> vogais = ['a', 'e', 'i', 'o', 'u']; //arayzinho de vogais comparativas
  String textoMinusculo = texto.toLowerCase(); //tudo minusculo ou maisculo é mais facil comparar

  for (int i = 0; i < textoMinusculo.length; i++) {
    if (vogais.contains(textoMinusculo[i])) {//olho se o caractere atual é uma vogal pelo index com o .contains
      contador++;
    }
  }
  return contador;
}

// Quarto: Função para buscar e ordenar as consoantes
String buscarConsoantes(String texto) {
  Set<String> consoantesEncontradas = {};
  List<String> vogais = ['a', 'e', 'i', 'o', 'u'];
  String textoMinusculo = texto.toLowerCase(); //mesma lógica de antes

  for (int i = 0; i < textoMinusculo.length; i++) {
    String letra = textoMinusculo[i];

    // RegExp é um regex. r: especifica que quero string brutas. '[a-z]' especifica que quero todas as letras entre a e b em formato string minusculas
    if (RegExp(r'[a-z]').hasMatch(letra) && !vogais.contains(letra)) { //hasMatch é um metodo que retorna um boolean verificando se a letra ta dentro do intervalo que passei no regex 
      consoantesEncontradas.add(letra);//se não for uma vogal é consoante
    }
  }

  List<String> consoantesOrdenadas = consoantesEncontradas.toList()..sort(); //tranformo em uma lista pra ordenação em cascata funcionar
  return consoantesOrdenadas.join(', ');
}


//PRINTS

void main() {
  String paragrafo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";

  //chamada
  print('parágrafo: $paragrafo');
  print('Numero de palavras: ${contarPalavras(paragrafo)}');
  print('Tamanho do texto: ${paragrafo.length}');
  print('Numero de frases: ${contarFrases(paragrafo)}');
  print('Numero de vogais: ${contarVogais(paragrafo)}');
  print('Consoantes encontradas: ${buscarConsoantes(paragrafo)}');
}