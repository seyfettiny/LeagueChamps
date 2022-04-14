import 'package:hive/hive.dart';

part 'info.g.dart';

@HiveType(typeId: 4)
class Info extends HiveObject{
  @HiveField(0)
  int? attack;
  @HiveField(1)
  int? defense;
  @HiveField(2)
  int? magic;
  @HiveField(3)
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
