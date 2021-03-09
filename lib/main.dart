import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex_app/home.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';


void main() => runApp(MaterialApp(
  home: MyApp()
));




// Title Screen
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}




class _MyAppState extends State < MyApp > {
  Future < List < Pokemon >> futurePokeList;

  Future < List < Pokemon >> createPokemonList() async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/Pokemon.json');
    List < dynamic > jsonArr = json.decode(data);
    List < Pokemon > pokemonList = [];
    for(Map<String,dynamic> obj in jsonArr) {
      pokemonList.add(Pokemon.fromJson(obj));
    }
    return pokemonList;
  }


  @override
  void initState() {
    super.initState();
    futurePokeList = createPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(255, 0, 12, 1), Color.fromRGBO(173, 0, 2, 1)],
              begin: Alignment.topCenter,
              stops: [0.1, 1],
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.center,
          child: getPokemon(),
        ),
      )
    );
  }

  Widget getPokemon() {
    return FutureBuilder < List < Pokemon >> (
      future: futurePokeList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TextButton(
           child: Image(
             image: new AssetImage('assets/Icon.png'),
             fit: BoxFit.fill
           ),
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Home(snapshot.data)),
             );
           },
         );
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return SizedBox(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation < Color > (Colors.white)), height: 70, width: 70);
        }
      }
    );
  }
}