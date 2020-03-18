class Attack {
  int _level;
  String _name;

  get level => this._level;
  get name => this._name;

  Attack({
    int level,
    String name
  }) {
    this._level = level;
    this._name = name;
  }

  factory Attack.fromJson(Map < String, dynamic > json) {
    return Attack(
      level: json['level'],
      name: _capitalize(json['name'])
    );
  }

  static String _capitalize(String s) {
    // for example: double-edge
    if(s.contains("-")) {
      List<String> stringList = s.split("-");
      String formatted = "";
      for(String s in stringList) {
        formatted += s[0].toUpperCase() + s.substring(1);
        formatted += " ";
      }
      return formatted;
    }
    else {
      return s[0].toUpperCase() + s.substring(1);
    }
  }

}