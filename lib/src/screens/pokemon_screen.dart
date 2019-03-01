import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon_model.dart';
import 'pokemon_detail_screen.dart';

class PokemonScreen extends StatefulWidget{
  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen>{
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokemonModel _pokemonModel;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    _pokemonModel = PokemonModel.fromJson(decodedJson);
    print(_pokemonModel.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('Poke App'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: _pokemonModel == null ? Center(
        child: CircularProgressIndicator(),
      ): GridView.count(
        crossAxisCount: 2,
        children: _pokemonModel.pokemon.map((poke)=> Container(
          padding: EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PokemonDetail(
                        pokemon: poke,
                      )
                  )
              );
            },
            child: Hero(
                tag: poke.img,
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(poke.img))
                        ),
                      ),
                      Text(
                        poke.name,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                )
            ),),
        ),).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}