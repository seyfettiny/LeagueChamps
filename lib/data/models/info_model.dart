import 'package:leaguechamps/domain/entities/info.dart';

class InfoModel extends Info {
  InfoModel({attack, defense, magic, difficulty})
      : super(
            attack: attack,
            defense: defense,
            magic: magic,
            difficulty: difficulty);

  InfoModel.fromJson(Map<String, dynamic> json) {
    attack = json['attack'];
    defense = json['defense'];
    magic = json['magic'];
    difficulty = json['difficulty'];
  }
  @override
  String toString() {
    return 'Info(attack: $attack, defense: $defense, magic: $magic, difficulty: $difficulty)';
  }
}
