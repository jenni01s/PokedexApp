import 'package:flutter/cupertino.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';

class TypeMatch extends StatelessWidget {
  final Pokemon _pokemon;
  TypeMatch(this._pokemon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: < Widget > [
          Row(
            children: < Widget > [
              Column(
                children: < Widget > [
                  Text('Strengths', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
                  SingleChildScrollView(
                    child: Row(
                      children: < Widget > [
                        ...(_typeIcons(this._pokemon.strengths))
                      ],
                    )
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: < Widget > [
                  Text('Weaknesses', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
                  Row(
                    children: < Widget > [
                      ...(_typeIcons(this._pokemon.weaknesses))
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      )
    );
  }

  static List < Widget > _typeIcons(List < String > types) {
    List < Widget > icons = new List < Widget > ();
    if (types[0] == "no strengths" && types.length == 1) {
      icons.add(Text("no strengths"));
      return icons;
    } else {
      if (types.length > 0) {
        icons.add(Image.asset('assets/Types/Types-${types[0]}.png', width: 50, height: 50));
      }
      if (types.length > 1) {
        icons.add(Image.asset('assets/Types/Types-${types[1]}.png', width: 50, height: 50));
      }
      if (types.length > 2) {
        icons.add(Image.asset('assets/Types/Types-${types[2]}.png', width: 50, height: 50));
      }
      return icons;
    }
  }

}