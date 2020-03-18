import 'package:flutter/material.dart';
import 'package:pokedex_app/displayCard.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';



class Home extends StatefulWidget {

  final List < Pokemon > _pokemonList;
  Home(this._pokemonList);

  @override
  _HomeState createState() => _HomeState(this._pokemonList);
}

class _HomeState extends State<Home> {
  List < Pokemon > _pokemonList;
  _HomeState(this._pokemonList);

  void _updatePokemon(List<Pokemon> pokemonList) {
    setState(() {
      this._pokemonList = pokemonList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          title: Text("Pokedex"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: < Color > [Color.fromRGBO(255, 0, 12, 1), Color.fromRGBO(173, 0, 2, 1)],
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu)
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: SearchBar(),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(2),
          itemCount: this.widget._pokemonList.length,
          itemBuilder: (BuildContext context, int index) {
            Pokemon pokemon = this.widget._pokemonList.elementAt(index);
            return Container(
              padding: const EdgeInsets.all(2),
                height: 100,
                child: DisplayCard(pokemon)
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
      ),
    );
  }
}

