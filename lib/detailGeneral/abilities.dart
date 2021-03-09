import 'package:flutter/material.dart';
import 'package:pokedex_app/pokemonData/ability.dart';


class Abilities extends StatelessWidget {
  final List < Ability > _abilities;
  final List < Color > _colors;
  Abilities(this._abilities, this._colors);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.width * 0.31,
      child: Column(
        children: <Widget>[
          Text('Abilities', style: TextStyle(fontSize: 15, color:  Color.fromRGBO(85, 158, 223, 1))),
          SizedBox(height: MediaQuery.of(context).size.width * 0.005),
          ...(_listAbContainer(_abilities, _colors, context))
        ],
      ),
    );
  }

  static List<Widget> _listAbContainer(List<Ability> abList, List<Color> colors, BuildContext context) {
    List<Widget> container = [];
    for(Ability ab in abList) {
      container.add(_abilityContainer(ab, colors, context));
      container.add(SizedBox(height: MediaQuery.of(context).size.width * 0.01));
    }
    return container;
  }

  static ClipRRect _abilityContainer(Ability ab, List<Color> colors, BuildContext context) {
    if (ab.isHidden) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(70),
        child: Container(
          width: 300,
          height: MediaQuery.of(context).size.width * 0.07,
          color: colors[1],
          child: Row(
            children: < Widget > [
              Container(
                width: 70,
                color: colors[0],
                child: Center(
                  child: Text('Hidden', style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ),
              Container(
                child: Text(ab.name, style: TextStyle(fontSize: 15)),
                margin: EdgeInsets.only(left: 45),
              ),
            ],
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(70),
        child: Container(
          width: 300,
          height: MediaQuery.of(context).size.width * 0.07,
          color: colors[1],
          child: Center(
            child: Text(ab.name, style: TextStyle(fontSize: 15))
          ),
        ),
      );
    }
  }

}