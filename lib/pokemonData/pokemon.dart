import 'package:flutter/material.dart';
import 'package:pokedex_app/pokemonData/breed.dart';
import 'package:pokedex_app/pokemonData/ability.dart';
import 'package:pokedex_app/pokemonData/attack.dart';


class Pokemon {
  int _id;
  String _name;
  String _categorie;
  double _weight;
  double _size;
  List < String > _types;
  List < Ability > _abilities;
  List < int > _stats;
  List < Attack > _attacks;
  Breed _breeding;
  String _normalSprit;
  String _shinySprit;
  List < String > _weaknesses;
  List < String > _strengths;
  List < Color > _colors;


  Pokemon({
    int id,
    String name,
    String categorie,
    double weight,
    double size,
    List < String > types,
    List < Ability > abilities,
    List < int > stats,
    List < Attack > attacks,
    Breed breeding,
    String normalSprit,
    String shinySprit,
    List < String > strengths,
    List < String > weaknesses,
    List < Color > colors
  }) {
    this._id = id;
    this._name = name;
    this._categorie = categorie;
    this._weight = weight;
    this._size = size;
    this._types = types;
    this._abilities = abilities;
    this._stats = stats;
    this._attacks = attacks;
    this._breeding = breeding;
    this._normalSprit = normalSprit;
    this._shinySprit = shinySprit;
    this._strengths = strengths;
    this._weaknesses = weaknesses;
    this._colors = colors;
  }

  get id => this._id;
  get name => this._name;
  get categorie => this._categorie;
  get weight => this._weight;
  get size => this._size;
  get abilities => this._abilities;
  get types => this._types;
  get stats => this._stats;
  get attacks => this._attacks;
  get breeding => this._breeding;
  get normalSprit => this._normalSprit;
  get shinySprit => this._shinySprit;
  get strengths => this._strengths;
  get weaknesses => this._weaknesses;
  get colors => this._colors;


  static List < Color > calcColors(types) {
    List < Color > colors;
    String type = types[0];
    // for normal/fairy or normal/flying -> color of second type
    if (types.length == 2 && types[0] == "normal") {
      type = types[1];
    }
    switch (type) {
      case "grass":
        colors = [Colors.green, Colors.lightGreen[200], Color.fromRGBO(95, 188, 81, 0.9)];
        break;
      case "bug":
        colors = [Colors.lime, Colors.lime[200], Color(0xffafc836)];
        break;
      case "dark":
        colors = [Colors.grey[900], Color(0xff7b7c82), Color(0xff6e7587)];
        break;
      case "dragon":
        colors = [Colors.indigo[800], Colors.indigo[200], Color(0xff0180cf)];
        break;

      case "electric":
        colors = [Colors.yellowAccent[700], Colors.yellow[100], Color(0xffedd537)];
        break;
      case "fairy":
        colors = [Colors.pinkAccent[100], Colors.pink[50], Color(0xffF3A7E7)];
        break;
      case "fighting":
        colors = [Colors.deepOrange[900], Colors.deepOrange[100], Color(0xffe74347)];
        break;
      case "flying":
        colors = [Colors.lightBlue[200], Colors.lightBlue[50], Color(0xffa6c2f2)];
        break;

      case "ghost":
        colors = [Colors.deepPurple[900], Colors.deepPurple[100], Color(0xff777bd4)];
        break;
      case "ground":
        colors = [Color(0xffc28764), Color(0xffefbc9e), Color(0xffd29463)];
        break;
      case "rock":
        colors = [Color(0xffC6B689), Color(0xfff9f2c5), Color(0xffd7cd90)];
        break;
      case "fire":
        colors = [Colors.orange[600], Colors.orange[200], Color(0xfffb9b51)];
        break;

      case "ice":
        colors = [Colors.cyan[200], Colors.cyan[100], Color(0xff8cddd4)];
        break;
      case "water":
        colors = [Colors.lightBlue[800], Colors.lightBlue, Color(0xff69b9e3)];
        break;
      case "poison":
        colors = [Colors.purple[800], Colors.purple[200], Color(0xffc261d4)];
        break;
      case "steel":
        colors = [Colors.blueGrey[700], Colors.blueGrey[200], Color(0xff58A6AA)];
        break;

      case "normal":
        colors = [Colors.grey, Colors.grey[200], Color(0xffa2a49e)];
        break;
      case "psychic":
        colors = [Colors.redAccent[100], Color(0xfff8d3ce), Color(0xfffe9f92)];
        break;
    }
    return colors;

  }



  factory Pokemon.fromJson(Map < String, dynamic > json) {

    return Pokemon(
      id: json['id'],
      name: _capitalize(json['name']),
      categorie: _capitalize(json['categorie']),
      weight: (json['weight'] / 10),
      size: (json['size'] / 10),
      types: new List < String > .from(json['types'].map((item) => _capitalize(item)).toList()),
      abilities: new List < Ability > .from(json['abilities'].map((item) => Ability.fromJson(item))),
      attacks: new List < Attack > .from(json['attacks'].map((item) => Attack.fromJson(item))),
      stats: new List < int > .from(json['stats'].map((item) => item as int).toList()),
      breeding: Breed.fromJson(json['breeding']),
      normalSprit: json['normalSprit'],
      shinySprit: json['shinySprit'],
      weaknesses: new List < String > .from(json['weaknesses'].map((item) => _capitalize(item)).toList()),
      strengths: new List < String > .from(json['strengths'].map((item) => _capitalize(item)).toList()),
      colors: calcColors(new List < String > .from(json['types'].map((item) => item as String).toList()))
    );
  }


  static String _capitalize(String s) {
    // for example: sheer-force
    if (s.contains("-")) {
      List < String > stringList = s.split("-");
      String formatted = "";
      for (String s in stringList) {
        formatted += s[0].toUpperCase() + s.substring(1);
        formatted += " ";
      }
      return formatted;
    } else {
      return s[0].toUpperCase() + s.substring(1);
    }
  }
}