import 'package:flutter/material.dart';
import 'package:pokedex_app/detailGeneral/dividLine.dart';
import 'package:pokedex_app/pokemonData/breed.dart';


class Breeding extends StatelessWidget {
  final Breed _breedInfo;
  Breeding(this._breedInfo);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: < Widget > [
        Column(
          children: < Widget > [
            Text('Breeding', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: < Widget > [
                  Column(
                    children: < Widget > [
                      Text('Egg Group', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
                      SizedBox(height: 10),
                      ...(_eggGroupInfo(this._breedInfo.eggGroup))
                    ],
                  ),
                  DividLine(70),
                  Column(
                    children: < Widget > [
                      Text('Hatch Time', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
                      SizedBox(height: 10),
                      Text('${this._breedInfo.hatchSteps} Steps')
                    ],
                  ),
                  DividLine(70),
                  Text('', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
                  _genderInfo(this._breedInfo.femaleGenderRate),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  static Widget _genderInfo(double femaleGender) {
    if (femaleGender == 0) {
      return Column(
        children: < Widget > [
          Text('Gender', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
          SizedBox(height: 10),
          Text('-', style: TextStyle(fontSize: 15)),
        ]
      );
    } else {
      return Column(
        children: < Widget > [
          Text('Gender', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
          SizedBox(height: 10),
          Row(
            children: < Widget > [
              Column(
                children: < Widget > [
                  Text('${100 - femaleGender} %', style: TextStyle(fontSize: 15, color: Color.fromRGBO(128, 182, 244, 1))),
                  Text('$femaleGender %', style: TextStyle(fontSize: 15, color: Color.fromRGBO(206, 113, 225, 1)))
                ],
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  value: (100 - femaleGender) / 100,
                  backgroundColor: Color.fromRGBO(206, 113, 225, 1),
                  valueColor: AlwaysStoppedAnimation < Color > (Color.fromRGBO(128, 182, 244, 1)),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  static List < Widget > _eggGroupInfo(List < String > eggGroup) {
    if (eggGroup.length == 2) {
      return [
        Text(eggGroup[0], style: TextStyle(fontSize: 15)),
        Text(eggGroup[1], style: TextStyle(fontSize: 15))
      ];
    } else {
      return [
        Text(eggGroup[0], style: TextStyle(fontSize: 15))
      ];
    }
  }
}