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
  List < Pokemon > _pokemonList;
  _HomeState(this._pokemonList);
  bool _searchEnabled = true;
  final ItemScrollController _controller = ItemScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: Icon(Icons.menu)
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: searchBar(),
          ),
        ),
      ),
      body: ScrollablePositionedList.separated(
        padding: const EdgeInsets.all(1),
          itemScrollController: _controller,
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
    );
  }

  Widget searchBar() {
    return Container(
      height: 50.0,
      child: Center(
        child: TextField(
          controller: _textController,
          enabled: _searchEnabled,
          // enter pressed: 
          onSubmitted: (text) {
            _triggerAnimation(_formatTextInput(text));
          },
          decoration: InputDecoration(
            prefixIcon: new IconTheme(
              data: new IconThemeData(color: Colors.grey),
              child: new IconButton(icon: Icon(Icons.search), onPressed: () => _triggerAnimation(_formatTextInput(_textController.text))),
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


  _triggerAnimation(id){
     setState(() {
      this._searchEnabled = false;
    });
    _controller.scrollTo(index: id, duration: Duration(milliseconds: 2500), curve: Curves.fastOutSlowIn);
     setState(() {
      this._searchEnabled = true;
    });
  } 

  int _formatTextInput(String text) {
    int num = 0;
    text = text.replaceAll(' ', '');
    if (text.isNotEmpty) {
      // search by Number in Pokedex
      if (isNumeric(text)) {
        int textNum = int.parse(text);
        if (textNum >= 1 && textNum <= 807) {
          num = textNum - 1;
        }
      }
      // go to certain Region 
      else if (text == 'Kanto') {
        num = 0;
      } else if (text == 'Johto') {
        num = 151;
      } else if (text == 'Hoenn') {
        num = 251;
      } else if(text == 'Sinnoh') {
        num = 386;
      }
      else if(text == 'Unova' || text == 'Einall') {
        num = 493;
      }
      else if(text == 'Kalos') {
        num = 649;
      }
      else if(text == 'Alola') {
        num = 721;
      }
      else {
        // search by Name
        for (Pokemon pokemon in this._pokemonList) {
          if (pokemon.name.contains(text)) {
            num = pokemon.id - 1;
            break;
          }
        }
      }
    }
    return num;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

}