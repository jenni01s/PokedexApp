import 'package:flutter/material.dart';

class DividLine extends StatelessWidget {

  final double length;
  DividLine(this.length);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.length,
      width: 0.5,
      color: Colors.grey,
      margin: EdgeInsets.only(left: 20, right: 20),
    );
  }

}