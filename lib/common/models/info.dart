class Info {
  int? attack;
  int? defense;
  int? magic;
  int? difficulty;

  Info({attack, defense, magic, difficulty});

  Info.fromJson(Map<String, dynamic> json) {
    attack = json['attack'];
    defense = json['defense'];
    magic = json['magic'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attack'] = attack;
    data['defense'] = defense;
    data['magic'] = magic;
    data['difficulty'] = difficulty;
    return data;
  }
}