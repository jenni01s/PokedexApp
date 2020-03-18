import 'package:flutter/material.dart';
import 'package:pokedex_app/detailGeneral/dividLine.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';

class WeightTypeSize extends StatelessWidget {
  final Pokemon _pokemon;
  WeightTypeSize(this._pokemon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: < Widget > [
          Column(
            children: < Widget > [
              Text('Weight', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
              SizedBox(height: 10),
              Text(this._pokemon.weight.toString() + ' kg',  style: TextStyle(fontSize: 15)),
            ],
          ),
          DividLine(40),              
          Column(
            children: < Widget > [
              Text('Type',style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
              Row(
                children: _typeIcons(this._pokemon.types).toList(),
              ),
            ],
          ),
          DividLine(40),
          Column(
            children: < Widget > [
              Text('Size',  style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
              SizedBox(height: 10),
              Text(this._pokemon.size.toString() + ' m',  style: TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
  static List<Widget> _typeIcons(List<String> types) {
    List<Widget> typeIcons = new List<Widget>();
    if (types.length == 1) {
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[0]}.png', width: 80)));
    } else {
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[0]}.png', width: 40)));
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[1]}.png', width: 40)));
    }
    return typeIcons;
  }
}
