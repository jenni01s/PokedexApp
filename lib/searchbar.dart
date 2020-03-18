import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: new IconTheme(
              data: new IconThemeData(color: Colors.grey),
              child: new Icon(Icons.search),
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

}