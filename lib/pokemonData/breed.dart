
class Breed {
  double _femaleGenderRate;
  List<String> _eggGroup;
  int _hatchSteps;
  
  get femaleGenderRate => this._femaleGenderRate;
  get eggGroup => this._eggGroup;
  get hatchSteps => this._hatchSteps;

  Breed({int gender, List<String> eggGroup, int steps}) {
   if(gender == -1 || gender == 8) { // genderless or only male or only Pokemon
    this._femaleGenderRate = 0;
   }
   else {
    this._femaleGenderRate = (gender / 8) * 100;
   }
  
   this._eggGroup = eggGroup;
   this._hatchSteps =  255 * ( steps + 1);
  }

  factory Breed.fromJson(Map < String, dynamic > json) {
    return Breed(
      gender: json['female_gender_rate'],
      eggGroup: new List < String >.from(json['eggGroup'].map((item) => _capitalize(item)).toList()),
      steps: json['hatchCounter']
    );
  }
  static String _capitalize(String s) {
    if(s == "indeterminate") {
      return "Amorphous";
    }
    else if(s == "no-eggs") {
      return " - ";
    }
    else {
      return s[0].toUpperCase() + s.substring(1);
    }
    
  }
}