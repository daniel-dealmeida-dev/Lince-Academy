import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/state.dart'; // Importe seu arquivo onde está o PersonProvider
import 'screens/homeScreen.dart';
import 'screens/people_list_screen.dart';
import 'screens/person_form_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PersonProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Type App',
      theme: ThemeData.dark(), 
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/list': (context) => const PeopleListScreen(),
        '/form': (context) => const PersonFormScreen(),
      },
    );
  }
}