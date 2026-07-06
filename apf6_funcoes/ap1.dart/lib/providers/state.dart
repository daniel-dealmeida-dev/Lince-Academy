import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonProvider with ChangeNotifier{
  final List<Person> _people = [];
  String _searchQuery = "";


  //getter
  List<Person> get allPeople => List.unmodifiable(_people); //usei o List.unmodifiable pra evitar code smells
  List<Person> get filteredPeople{
    if(_searchQuery.isEmpty) return allPeople;

    return _people.where((person)=>
      person.name.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  //atualiza filto
  void setSearchQuery(String query){
    _searchQuery = query;
    notifyListeners();
  }

  //inclui pessoa
  void addPerson(Person person){
    _people.add(person);
    notifyListeners();
  }


  void removePerson(String id) { // Garanta que o parâmetro seja String aqui
    _people.removeWhere((person) => person.id == id);
    notifyListeners();
  }

  void updatePerson(Person updatedPerson){
    final index = _people.indexWhere((p) => p.id == updatedPerson.id);
    if(index != -1){
      _people[index] = updatedPerson;
      notifyListeners();
    }
  }
}