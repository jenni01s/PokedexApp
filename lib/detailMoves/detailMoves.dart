import 'package:flutter/material.dart';
import 'package:pokedex_app/detailMoves/moveCard.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';


class DetailMoves extends StatefulWidget {
  final Pokemon _pokemon;
  DetailMoves(this._pokemon);
  @override
  State < StatefulWidget > createState() {
    return _DetailMoves(this._pokemon);
  }
}

class _DetailMoves extends State < DetailMoves > {
  Pokemon _pokemon;
  _DetailMoves(this._pokemon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: < Widget > [
          Text(this._pokemon.name, style: TextStyle(fontSize: 40)),
          Text(this._pokemon.categorie, style: TextStyle(fontSize: 15)),
          SizedBox(height: 10),
          Container(
            height: 30,
            width: 400,
            padding: EdgeInsets.only(left: 30, right: 40),
            color: this._pokemon.colors[1],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: < Widget > [
                Text('Level'),
                Text('Attack'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 1),
            height: MediaQuery.of(context).size.width * 0.8,
            child: ListView.builder(
              itemCount: this._pokemon.attacks.length,
              itemBuilder: (BuildContext context, int index) {
                return MoveCard(this._pokemon.attacks[index].level,this._pokemon.attacks[index].name);
              }
            ),
          ),
        ],
      ),
    );
  }

}