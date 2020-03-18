import 'package:flutter/material.dart';
import 'package:pokedex_app/detailBackground.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';

class DisplayCard extends StatelessWidget {
  final Pokemon _pokemon;
  DisplayCard(this._pokemon);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailBackground(this._pokemon)),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image(image: AssetImage('assets/PokemonImg/${this._pokemon.id}.png')),
          title: Text(this._pokemon.name, style: TextStyle(fontSize: 18)),
          subtitle: Text(_formatNum(this._pokemon.id), style: TextStyle(fontSize: 12)),
          trailing: SingleChildScrollView(
            child: Row(
              children: _typeIcons(this._pokemon.types).toList(),
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
      ),
    );
  }

  static String _formatNum(int n) {
    if (n <= 9) {
      return "#00" + n.toString();
    } else if (n > 9 && n <= 99) {
      return "#0" + n.toString();
    } else {
      return "#" + n.toString();
    }
  }

  static List<Widget> _typeIcons(List<String> types) {
    List<Widget> typeIcons = new List<Widget>();
    if (types.length == 1) {
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[0]}.png', width: 120, height: 50)));
    } else {
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[0]}.png', width: 50, height: 50)));
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[1]}.png', width: 50, height: 50)));
    }
    return typeIcons;
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: new IconTheme(
              data: new IconThemeData(color: Colors.grey),
              child: new Icon(Icons.search),
            ),
            filled: true,
            border: InputBorder.none,
            hintText: 'Go to Pokemon',
            contentPadding: const EdgeInsets.only(left: 8.0, bottom: 12, top: 10),
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          ),
        ),
      ),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
        color: Color.fromRGBO(0, 0, 0, 0.25),
      ),
      padding: new EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      margin: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0)
    );
  }

}