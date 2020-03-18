import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_app/detailGeneral/dividLine.dart';
import 'package:pokedex_app/pokemonData/pokemon.dart';

class Sprites extends StatelessWidget {
  final Pokemon _pokemon;
  Sprites(this._pokemon);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: < Widget > [
        Container(
          child: Column(
            children: < Widget > [
              Text('Sprites', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
              SizedBox(height: 5),
              Row(
                children: < Widget > [
                  Column(
                    children: < Widget > [
                      Text('Normal', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
                      SizedBox(height: 2),
                      CachedNetworkImage(
                        imageUrl: this._pokemon.normalSprit,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 130,
                        width: 130,
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  DividLine(100),
                  SizedBox(width: 20),
                  Column(
                    children: < Widget > [
                      Text('Shiny', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
                      SizedBox(height: 2),
                      CachedNetworkImage(
                        imageUrl: this._pokemon.shinySprit,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 130,
                        width: 130,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]
    );
  }
}