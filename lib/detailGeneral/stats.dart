import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  final List < int > _stats;
  final List < Color > _colors;
  Stats(this._stats, this._colors);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: < Widget > [
        Column(
          children: < Widget > [
            Text('Base Stats', style: TextStyle(fontSize: 15, color: Color.fromRGBO(85, 158, 223, 1))),
            SizedBox(height: 7),
            Row(
              children: < Widget > [
                Column(
                  children: < Widget > [
                    Text('HP', style: TextStyle(fontSize: 15, color: this._colors[0])),
                    SizedBox(height: 7),
                    Text('ATK', style: TextStyle(fontSize: 15, color: this._colors[0])),
                    SizedBox(height: 7),
                    Text('DEF', style: TextStyle(fontSize: 15, color: this._colors[0])),
                    SizedBox(height: 7),
                    Text('SATK', style: TextStyle(fontSize: 15, color: this._colors[0])),
                    SizedBox(height: 7),
                    Text('SDEF', style: TextStyle(fontSize: 15, color: this._colors[0])),
                    SizedBox(height: 7),
                    Text('INIT', style: TextStyle(fontSize: 15, color: this._colors[0])),
                  ],
                ),
                SizedBox(width: 5),
                Column(
                  children: < Widget > [
                    Text(_formatStat(this._stats[5]), style: TextStyle(fontSize: 15)),
                    SizedBox(height: 7),
                    Text(_formatStat(this._stats[4]), style: TextStyle(fontSize: 15)),
                    SizedBox(height: 7),
                    Text(_formatStat(this._stats[3]), style: TextStyle(fontSize: 15)),
                    SizedBox(height: 7),
                    Text(_formatStat(this._stats[2]), style: TextStyle(fontSize: 15)),
                    SizedBox(height: 7),
                    Text(_formatStat(this._stats[1]), style: TextStyle(fontSize: 15)),
                    SizedBox(height: 7),
                    Text(_formatStat(this._stats[0]), style: TextStyle(fontSize: 15)),
                  ],
                ),
                SizedBox(width: 5),
                Column(
                  children: < Widget > [
                    // HP
                    Container(
                      width: 255,
                      height: 7,
                      child: LinearProgressIndicator(
                        value: this._stats[5] / 255,
                        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                        valueColor: AlwaysStoppedAnimation < Color > (this._colors[0]),
                      ),
                    ),
                    SizedBox(height: 18),
                    // ATK
                    Container(
                      width: 255,
                      height: 7,
                      child: LinearProgressIndicator(
                        value: this._stats[4] / 255,
                        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                        valueColor: AlwaysStoppedAnimation < Color > (this._colors[0]),
                      ),
                    ),
                    SizedBox(height: 18),
                    // DEF
                    Container(
                      width: 255,
                      height: 7,
                      child: LinearProgressIndicator(
                        value: this._stats[3] / 255,
                        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                        valueColor: AlwaysStoppedAnimation < Color > (this._colors[0]),
                      ),
                    ),
                    SizedBox(height: 18),
                    // SATK
                    Container(
                      width: 255,
                      height: 7,
                      child: LinearProgressIndicator(
                        value: this._stats[2] / 255,
                        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                        valueColor: AlwaysStoppedAnimation < Color > (this._colors[0]),
                      ),
                    ),
                    SizedBox(height: 18),
                    // SDEF
                    Container(
                      width: 255,
                      height: 7,
                      child: LinearProgressIndicator(
                        value: this._stats[1] / 255,
                        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                        valueColor: AlwaysStoppedAnimation < Color > (this._colors[0]),
                      ),
                    ),
                    SizedBox(height: 18),
                    // INIT
                    Container(
                      width: 255,
                      height: 7,
                      child: LinearProgressIndicator(
                        value: this._stats[0] / 255,
                        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                        valueColor: AlwaysStoppedAnimation < Color > (this._colors[0]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static String _formatStat(int n) {
    if (n < 10) {
      return "00" + n.toString();
    } else if (n >= 10 && n < 100) {
      return "0" + n.toString();
    } else {
      return n.toString();
    }
  }


}