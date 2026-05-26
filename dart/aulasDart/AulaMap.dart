void main(){
  var comentarios = {
    'Java' : 'Comentei sobre Java',
    'Dart' : 'Comentei sobre Dart',
    'Python' : 'Comentei sobre Python',
  };
  print(comentarios);

  Map<String, String> comentarios2 = Map<String, String>();
  comentarios2['java'] = 'Comentário sobre Java';
  comentarios2['dart'] = 'Comentário sobre Dart';
  comentarios2['python'] = 'Comentário sobre Python';
    
  //comentarios2.values.forEach((element){
    //print('Chave: $element'); 
    //});
comentarios2.forEach((chave, valor) {
    print('$chave => $valor');
  });
 
}