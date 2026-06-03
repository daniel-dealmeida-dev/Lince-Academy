import 'dart:math'; 

void main() { //lista
  List<String> nomes = [
    'Ana', 'Francisco', 'Joao', 'Pedro', 'Gabriel', 'Rafaela', 'Marcio', 
    'Jose', 'Carlos', 'Patricia', 'Helena', 'Camila', 'Mateus', 'Gabriel', 
    'Maria', 'Samuel', 'Karina', 'Antonio', 'Daniel', 'Joel', 'Cristiana', 
    'Sebastião', 'Paula'
  ];

  List<String> sobrenomes = [ //lista
    'Silva', 'Ferreira', 'Almeida', 'Azevedo', 'Braga', 'Barros', 'Campos', 
    'Cardoso', 'Teixeira', 'Costa', 'Santos', 'Rodrigues', 'Souza', 'Alves', 
    'Pereira', 'Lima', 'Gomes', 'Ribeiro', 'Carvalho', 'Lopes', 'Barbosa'
  ];


    final contador = Random();


  // Primeiro:  pegar um índice aleatório para a lista de nomes e resgatar o nome
    final indiceNome = contador.nextInt(nomes.length);
    final nomeAleatorio = nomes[indiceNome];

  // segundo: Pegar um índice aleatório para a lista de sobrenomes e resgatar o sobrenome
    final indiceSobrenome = contador.nextInt(sobrenomes.length);
    final sobrenomeAleatorio = sobrenomes[indiceSobrenome];
    final nomeCompleto = '$nomeAleatorio $sobrenomeAleatorio';

  print('Sugestão de nome completo: $nomeCompleto');
}