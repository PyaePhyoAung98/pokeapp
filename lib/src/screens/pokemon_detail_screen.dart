import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonDetail extends StatelessWidget{

  final Pokemon pokemon;

  PokemonDetail({this.pokemon});

  Widget pokeWidget(BuildContext context)=>Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height*0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Text(
                pokemon.name,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text("Height ${pokemon.height}", style: TextStyle(fontSize: 16.0),),
              Text("Weight ${pokemon.weight}", style: TextStyle(fontSize: 16.0),),
              Text("Types", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map(
                        (t)=> FilterChip(
                          backgroundColor: Colors.amber,
                          label: Text(t),
                          onSelected: (b)=>{},
                        )
                ).toList(),
              ),
              Text(
                "Weaknesses",
                style:
                TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map(
                        (t)=> FilterChip(
                      backgroundColor: Colors.red,
                      label: Text(t, style: TextStyle(color: Colors.white),),
                      onSelected: (b)=>{},
                    )
                ).toList(),
              ),
              Text(
                "Next Evolution",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              pokemon.nextEvolution == null ? Center(
                child: Chip(
                  label: Text('No evolution', style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.green,
                ),
              ):
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.nextEvolution.map(
                        (t)=> FilterChip(
                      backgroundColor: Colors.green,
                      label: Text(t.name, style: TextStyle(color: Colors.white),),
                      onSelected: (b)=>{},
                    )
                ).toList(),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
            tag: pokemon.img, 
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(pokemon.img))
              ),
            )),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: pokeWidget(context),
    );
  }
}