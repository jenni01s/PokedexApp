import 'package:flutter/material.dart';


class MoveCard extends StatelessWidget {

  final int _level;
  final String _atkName;
 

  MoveCard(this._level, this._atkName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: < Widget > [
        Container(
          height: 45,
          width: 300,
          padding: EdgeInsets.only(left: 55, right: 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${this._level}', style: TextStyle(fontSize: 15)),
              Text('${this._atkName}', style: TextStyle(fontSize: 15)),
            ],
          )
        ),
        Container(
          width: 350,
          height: 0.2,
          color: Colors.grey,
        ),
      ],
    );
  }

}