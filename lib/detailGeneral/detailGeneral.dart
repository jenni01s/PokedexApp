
import 'package:pokedex_app/detailGeneral/abilities.dart';
import 'package:pokedex_app/detailGeneral/stats.dart';
import 'package:pokedex_app/detailGeneral/weightTypeSize.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';

class DetailGeneral extends StatefulWidget {
  final Pokemon _pokemon;
 
  DetailGeneral(this._pokemon);
  @override
  State<StatefulWidget> createState() {
    return _DetailGeneralState(this._pokemon);
  }
}

class _DetailGeneralState extends State < DetailGeneral > {
  Pokemon _pokemon;
  _DetailGeneralState(this._pokemon);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: < Widget > [
            Text(this._pokemon.name, style: TextStyle(fontSize: 40)),
            Text(this._pokemon.categorie, style: TextStyle(fontSize: 15)),
            WeightTypeSize(this._pokemon),
            Abilities(this._pokemon.abilities, this._pokemon.colors),
            Stats(this._pokemon.stats, this._pokemon.colors),
          ],
        ),
      ),
    );
  }

}