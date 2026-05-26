import 'dart:math';

void main(){
  List<int> lista = [];
  int numeroAleatorio;
  
  do {
    numeroAleatorio = Random().nextInt(100);

    // Verificando se o número aleatório já existe na lista antes de adicioná-lo
    if (!lista.contains(numeroAleatorio)){ // if usando o .contains pra garantir que o número aleatório gerado não seja repetido, evitando números duplicados na lista
      lista.add(numeroAleatorio);
      
     // Encontrando a posição do número aleatório recém-adicionado usando indexOf
      int posicaoReal = lista.indexOf(numeroAleatorio);
      

      print('Posicao: $posicaoReal, valor: $numeroAleatorio');
    }
    //while usando o .lenght pra garantir que o loop continue até que a lista tenha tamanho 10
  } while (lista.length < 10);
}