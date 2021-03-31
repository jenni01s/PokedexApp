import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:pokedex_app/displayCard.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';


class Home extends StatefulWidget {

  final List < Pokemon > _pokemonList;
  Home(this._pokemonList);

  @override
  _HomeState createState() => _HomeState(this._pokemonList);
}

class _HomeState extends State < Home > {
  Icon _searchIcon = Icon(Icons.search, color: Colors.grey);
  List < Pokemon > _pokemonList;
  final TextEditingController _textController = TextEditingController();
  // FocusNode _focus;
  PokemonSearch _search;

  _HomeState(_pokemonList) {
    this._pokemonList = _pokemonList;
    this._search = new PokemonSearch(_pokemonList);
    // this._focus = new FocusNode();
  }


  @override
  void initState() {
    super.initState();
    // this._focus.addListener(_onFocusChange);
  }

  // void _onFocusChange() {
  //   if (this._focus.hasFocus) {
  //     showSearch(context: context, delegate: this._search);
  //     // this._search.showResults(context);
  //   } else {
  //     //this._search.close(context, null);
  //   }
  // }
  //TODO: Change Design of App Bar
  @override
  Widget build(BuildContext context) {
    // this._textController.addListener(() {
    //   if (this._textController.text.isEmpty) {
    //     setState(() {
    //       this._search.close(context, null);
    //     });
    //   } else {
    //     setState(() {
    //       showSearch(context: context, delegate: this._search);
    //     });
    //   }
    // });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          title: Text("Pokedex"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: < Color > [Color.fromRGBO(255, 0, 12, 1), Color.fromRGBO(173, 0, 2, 1)],
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu), onPressed: () {},
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: searchBar(),
          ),
        ),
      ),
      body:
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
      )
    );
  }

  Widget searchBar() {
    return Container(
      height: 50.0,
      child: Center(
        child: TextFormField(
          controller: _textController,
          //enabled: _searchEnabled,
          decoration: InputDecoration(
            suffixIcon: new IconButton(icon: _searchIcon, onPressed: () => showSearch(context: context, delegate: this._search)),
            filled: true,
            border: InputBorder.none,
            hintText: 'Search a Pokemon',
            contentPadding: const EdgeInsets.only(left: 8.0, bottom: 12, top: 10),
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
          // focusNode: this._focus
          onTap: () => showSearch(context: context, delegate: this._search),
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

  // Future < List < Pokemon>> filterPokemon(String filter) async{
  //     return this._pokemonList.where((pokemon) => pokemon.name.toLowerCase().startsWith(filter.toLowerCase())).toList();
  // }

  _filterPokemon(String value) {
    setState(() {
      // this._searchText = value;
      // this._filteredList = this._pokemonList.where((pokemon) => pokemon.name.toLowerCase().startsWith(this._searchText.toLowerCase())).toList();
      //this._buildListView(true);
      // this._filteredList = Future < List < Pokemon >> .delayed(
      //   const Duration(seconds: 1),
      //     () => this._pokemonList.where((pokemon) => pokemon.name.toLowerCase().startsWith(value.toLowerCase())).toList()
      // );
      // sort by Pokemon ID:
      //Future.forEach((pokemon) => print(pokemon.id));
      // this._filteredList.sort((a, b) => a.compareTo(b));
    });
  }

  //TODO: Edit setState of Searchbar TextFilter
  // _changeIcon() {
  //   setState(() {
  //     if (this._searchIcon.icon == Icons.search) {
  //       this._searchIcon = new Icon(Icons.close, color: Colors.grey);
  //       //this._searchEnabled = true;
  //     } else {
  //       //this._searchEnabled = false;
  //       this._searchIcon = new Icon(Icons.search);
  //       FocusScope.of(context).unfocus();
  //       this._textController.clear();
  //     }
  //   });
  // }



  /* // TODO: Only Search when enter is pressed 
  Widget _buildListView(bool enterPressed) {
    if (enterPressed == false) {
      return ListView.separated(
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
          separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
    } else {
      this._filteredList.forEach((element) {print(element.name);});
      return ListView.separated(
        addAutomaticKeepAlives: false,
        cacheExtent: 100,
        padding: const EdgeInsets.all(1),
          itemCount: this._filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            Pokemon pokemon = this._filteredList.elementAt(index);
            return Container(
              padding: const EdgeInsets.all(2),
                height: 90,
                child: DisplayCard(pokemon)
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
      // return FutureBuilder < List < Pokemon >> (
      //   future: filterPokemon(this._searchText),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       print(snapshot.data);
      //       return ListView.separated(
      //         addAutomaticKeepAlives: false,
      //         cacheExtent: 100,
      //         padding: const EdgeInsets.all(1),
      //           itemCount: snapshot.data.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             Pokemon pokemon = snapshot.data.elementAt(index);
      //             return Container(
      //               padding: const EdgeInsets.all(2),
      //                 height: 90,
      //                 child: DisplayCard(pokemon)
      //             );
      //           },
      //           separatorBuilder: (BuildContext context, int index) => const Divider(),
      //       );
      //     } else {
      //       return SizedBox(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation < Color > (Colors.black)), height: 70, width: 70);
      //     }
      //   }
      // );
    // }
  } */
  //if (text.isNotEmpty) {
  // search by Number in Pokedex
  //if (isNumeric(text)) {
  //int textNum = int.parse(text);
  //if (textNum >= 1 && textNum <= 807) {
  // num = textNum - 1;
  //}
  //}
  // go to certain Region 
  /*else if (text == 'Kanto') {
          num = 0;
  } else if (text == 'Johto') {
    num = 151;
  } else if (text == 'Hoenn') {
    num = 251;
  } else if (text == 'Sinnoh') {
    num = 386;
  } else if (text == 'Unova' || text == 'Einall') {
    num = 493;
  } else if (text == 'Kalos') {
    num = 649;
  } else if (text == 'Alola') {
    num = 721;
  }*/


  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

}


class PokemonSearch extends SearchDelegate < String > {
  List < Pokemon > _pokemonList;
  PokemonSearch(this._pokemonList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return super.appBarTheme(context);
    // return theme.copy
  }
  @override
  List < Widget > buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        this.query = "";
      }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      this.query = "";
      this.close(context, "");
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    List < Pokemon > filteredList = [];
    if (query.isNotEmpty) {
      filteredList = this._pokemonList.where((pokemon) => pokemon.name.toLowerCase().startsWith(this.query.toLowerCase())).toList();
    }
    if (filteredList.isEmpty) {
      return Container();
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

  @override
  void close(BuildContext context, String result) {
    FocusScope.of(context).unfocus();
    super.close(context, result);
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}