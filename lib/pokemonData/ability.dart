class Ability {
  String _name;
  bool _isHidden;

  Ability({
    String name,
    bool isHidden
  }) {
    this._name = name;
    this._isHidden = isHidden;
  }

  get name => this._name;
  get isHidden => this._isHidden;

  factory Ability.fromJson(Map < String, dynamic > json) {
    return Ability(
      name: _capitalize(json['name']),
      isHidden: json['is_hidden']
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