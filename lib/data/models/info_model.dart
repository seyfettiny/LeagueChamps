import '../../domain/entities/info.dart';

class InfoModel extends Info {
  InfoModel({attack, defense, magic, difficulty})
      : super(
            attack: attack,
            defense: defense,
            magic: magic,
            difficulty: difficulty);

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoModel &&
          runtimeType == other.runtimeType &&
          attack == other.attack &&
          defense == other.defense &&
          magic == other.magic &&
          difficulty == other.difficulty;

  @override
  int get hashCode =>
      attack.hashCode ^ defense.hashCode ^ magic.hashCode ^ difficulty.hashCode;

  @override
  String toString() {
    return 'Info(attack: $attack, defense: $defense, magic: $magic, difficulty: $difficulty)';
  }
}
