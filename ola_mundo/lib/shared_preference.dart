import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const AppThemeModeKey = 'AppThemeMode';
const AppCounterKey = 'AppCounter';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Pessoa(nome: 'João Pedro', idade: 70),
      child: const MyApp(),
    ),
  );
}


class _MyState extends ChangeNotifier{
  MyState(){
    _init();
  }

  late final SharedPreferences _sharedPreferences;

  var _isLight = true;
  var _counter = 0;

 bool get isLight => _isLight;

  void toggleTheme(){
    _isLight = !_isLight;
    _sharedPreferences.setBool(AppThemeModeKey, _isLight);
    notifyListeners();
  }

  Future<void> _init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _isLight = _sharedPreferences.getBool(AppThemeModeKey) ?? true;
    _counter = _sharedPreferences.getInt(AppCounterKey) ?? 0;
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MyState(),
      child: Consumer<_MyState>(
        builder: (context, state, child) => Scaffold(
          appBar: AppBar(title: const Center(child: Text('Exemplo Provider'))),
          body: Center(
            child: Text(


          ),
          
            
          ),
        ),
      ),
    );
  }
}
