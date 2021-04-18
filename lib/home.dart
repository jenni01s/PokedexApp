import 'package:flutter/material.dart';
import 'package:pokedex_app/displayCard.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
class Home extends StatefulWidget {

  final List < Pokemon > _pokemonList;
  Home(this._pokemonList);

  @override
  _HomeState createState() => _HomeState(this._pokemonList);
}

class _HomeState extends State < Home > {
  List < Pokemon > _pokemonList;
  PokemonSearch _search;

  _HomeState(_pokemonList) {
    this._pokemonList = _pokemonList;
    this._search = new PokemonSearch(_pokemonList);
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: ClipPath(
          clipper: WaveClipperOne(),
          child: AppBar(
            flexibleSpace: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 70),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.black),
                      shape: BoxShape.circle,
                      color: Colors.green
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.black),
                      shape: BoxShape.circle,
                      color: Colors.yellow
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.black),
                      shape: BoxShape.circle,
                      color: Colors.red
                    ),
                  )
                ],
              ),
              color: Color.fromRGBO(255, 0, 12, 1),
            ),
            leading: new Container(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Container(
        decoration: new BoxDecoration(
          border: Border.all(width: 5.0, color: Colors.grey),
          shape: BoxShape.circle,
        ),
        child:
        FloatingActionButton(
          onPressed: () {},
          child: IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: this._search);
          }), ),
      ),
      body:
      Padding(
        padding: EdgeInsets.only(top: 30),
        child:
        ListView.separated(
          addAutomaticKeepAlives: false,
          cacheExtent: 100,
          padding: const EdgeInsets.all(1),
            itemCount: this._pokemonList.length,
            itemBuilder: (BuildContext context, int index) {
              Pokemon pokemon = this._pokemonList.elementAt(index);
              return Container(
                padding: const EdgeInsets.all(2),
                  height: 90,
                  child: DisplayCard(pokemon)
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
        ),

      ),

      bottomNavigationBar: ClipPath(
        clipper: WaveClipperOne(reverse: true, flip: true),
        child: Container(
          color: Color.fromRGBO(255, 0, 1, 1),
          height: 40, )
      ),
    );
  }
}


class PokemonSearch extends SearchDelegate < String > {
  List < Pokemon > _pokemonList;
  bool clearPressed;
  PokemonSearch(this._pokemonList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    ThemeData theme = super.appBarTheme(context);
    assert(theme != null);
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        headline6: theme.textTheme.headline6.copyWith(
          color: Colors.white,
        )
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(255, 0, 12, 1),
      ),
    );
  }


  @override List < Widget > buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        this.query = "";
      }),
    ];
  }

  @override Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      this.query = "";
      this.close(context, "");
    });
  }
  String get searchFieldLabel => 'Search a Pokemon';

  bool _isNumeric(String s) {
    if (s == null || s.isEmpty) {
      return false;
    }
    return num.tryParse(s) != null;

  }

  @override Widget buildResults(BuildContext context) {
    List < String > regions = ["kanto", "johto", "hoenn", "sinnoh", "unova", "einall", "kalos", "alola"];
    List < Pokemon > filteredList = [];
    if (query.isNotEmpty) {
      if (regions.contains(query.toLowerCase())) {
        if (query.toLowerCase() == "kanto") {
          filteredList = this._pokemonList.sublist(0,151);
        }
        else if (query.toLowerCase() == "johto") {
          filteredList = this._pokemonList.sublist(151,251);
        }
        else if (query.toLowerCase() == "hoenn") {
          filteredList = this._pokemonList.sublist(251,386);
        }
        else if (query.toLowerCase() == "sinnoh") {
          filteredList = this._pokemonList.sublist(386,493);
        }
        else if (query.toLowerCase() == "unova" || query.toLowerCase() == "einall") {
          filteredList = this._pokemonList.sublist(493,649);
        }
        else if (query.toLowerCase() == "kalos") {
          filteredList = this._pokemonList.sublist(649,721);
        }
        else if (query.toLowerCase() == "alola") {
          filteredList = this._pokemonList.sublist(721,807);
        }
        else{
          filteredList = [];
        }
      } else if (this._isNumeric(query)) {
        filteredList = this._pokemonList.where((pokemon) => pokemon.id == int.parse(query)).toList();
      }
      else {
        filteredList = this._pokemonList.where((pokemon) => pokemon.name.toLowerCase().startsWith(this.query.toLowerCase())).toList();
      }
    }
    if (filteredList.isEmpty) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/shockPika.png'),
                width: 150,
                height: 150),
              Text("No results", style: TextStyle(fontSize: 20), ),
            ],
          ),
        )
      );
    } else {
      return
      ListView.separated(
        addAutomaticKeepAlives: false,
        cacheExtent: 100,
        padding: const EdgeInsets.all(1),
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            Pokemon pokemon = filteredList.elementAt(index);
            return Container(
              padding: const EdgeInsets.all(2),
                height: 90,
                child: DisplayCard(pokemon)
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
      );
    }
  }

  @override void close(BuildContext context, String result) {
    FocusScope.of(context).unfocus();
    super.close(context, result);
  }
  @override Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}