import 'package:flutter/material.dart';
import 'package:pokedex_app/detailGeneral/detailGeneral.dart';
import 'package:pokedex_app/detailMore/detailMore.dart';
import 'package:pokedex_app/detailMoves/detailMoves.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';


class DetailBackground extends StatefulWidget {
  final Pokemon _pokemon;
  DetailBackground(this._pokemon);

  @override
  _DetailBackgroundState createState() => _DetailBackgroundState(this._pokemon, this._pokemon.colors);
}

class _DetailBackgroundState extends State < DetailBackground > {
  
  Pokemon _pokemon;
  List<Color> _colors;
  _DetailBackgroundState(this._pokemon, this._colors);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: < Color > [this._colors[0], this._colors[2]],
        ),
      ),
      child: Stack(children: < Widget > [
          Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0), topRight: Radius.circular(70.0)),
            ),
            elevation: 5,
            margin: EdgeInsets.only(top: 105, right: 5, left: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0), topRight: Radius.circular(70.0)),
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Scaffold(
                  bottomNavigationBar: Material(
                    color: this._colors[0],
                    child: selectionBar(),
                  ),
                  body: TabBarView(
                    children: < Widget > [
                      DetailGeneral(this._pokemon),
                      DetailMoves(this._pokemon),
                      DetailMore(this._pokemon),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/PokemonImg/${this._pokemon.id}.png', width: 160, height: 160)
            ),
          ),
        ],
        overflow: Overflow.clip,
      ),
    );
  }

  Widget selectionBar() {
    return TabBar(
      indicatorColor: this._colors[1],
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black45,
      labelStyle: TextStyle(fontSize: 12),
      tabs: < Widget > [
        Container(
          width: 50,
          height: MediaQuery.of(context).size.width * 0.16,
          child: Tab(icon: Icon(Icons.info_outline, color: Color.fromRGBO(0, 0, 0, 1)), text: 'Info',),
        ),
        /*
        Container(
          width: 10,
          height: MediaQuery.of(context).size.width * 0.16,
          padding: EdgeInsets.only(top: 5),
          child: Tab(icon: Image.asset('assets/Evo_selected.png'), text: 'Evo')
        ),
        */
        Container(
          width: 50,
          height: MediaQuery.of(context).size.width * 0.16,
          padding: EdgeInsets.only(top: 5),
          child: Tab(icon: Image.asset('assets/TM_selected.png'), text: 'Moves')
        ),
        Container(
          width: 50,
          height: MediaQuery.of(context).size.width * 0.16,
          child: Tab(icon: Icon(Icons.add_circle_outline, color: Color.fromRGBO(0, 0, 0, 1)), text: 'More'),
        ),
      ],
    );
  }
}