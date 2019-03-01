import 'package:flutter/material.dart';
import 'screens/pokemon_screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poke App',
      home: PokemonScreen(),
    );
  }
}