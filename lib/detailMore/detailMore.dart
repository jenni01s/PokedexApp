import 'package:flutter/material.dart';
import 'package:pokedex_app/detailMore/breeding.dart';
import 'package:pokedex_app/detailMore/sprites.dart';
import 'package:pokedex_app/detailMore/typeMatch.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';



class DetailMore extends StatelessWidget {
  final Pokemon _pokemon;
  DetailMore(this._pokemon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: < Widget > [
          Text(this._pokemon.name, style: TextStyle(fontSize: 40)),
          Text(this._pokemon.categorie, style: TextStyle(fontSize: 15)),
          SizedBox(height: 15),
          Breeding(this._pokemon.breeding),
          TypeMatch(this._pokemon),
          Sprites(this._pokemon),
        ],
      ),
    );
  }

}