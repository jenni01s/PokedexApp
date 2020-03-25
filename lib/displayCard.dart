import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/detailBackground.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';

class DisplayCard extends StatefulWidget {
  Pokemon _pokemon;
  DisplayCard(this._pokemon);
  @override
  _DisplayCardState createState() => _DisplayCardState(this._pokemon);
}

class _DisplayCardState extends State < DisplayCard > {
  Pokemon _pokemon;
  String _id;
  String _url;
  bool _clicked;
  _DisplayCardState(Pokemon pokemon) {
    this._pokemon = pokemon;
    this._id = _formatNum(pokemon.id).substring(1);
    this._url = 'https://media.bisafans.de/6447cae/thumbs/300x300/pokemon/artwork/${this._id}.png';
    this._clicked = false;
  }
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
          leading: _showImage(this._clicked, this._url),
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

  Widget _showImage(bool show, String url) {
    if (show) {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        width: 50,
        height: 50
      );
    } else {
      return IconButton(icon: Image.asset('assets/Pokeball.png'), iconSize: 40, onPressed: () {
        _onClicked();
      });
    }
  }

  void _onClicked() {
    setState(() {
      this._clicked = true;
      return this._clicked;
    });
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

  static List < Widget > _typeIcons(List < String > types) {
    List < Widget > typeIcons = new List < Widget > ();
    if (types.length == 1) {
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[0]}.png', width: 120, height: 50)));
    } else {
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[0]}.png', width: 50, height: 50)));
      typeIcons.add(Tab(icon: Image.asset('assets/Types/Types-${types[1]}.png', width: 50, height: 50)));
    }
    return typeIcons;
  }

}