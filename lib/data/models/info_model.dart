import 'package:equatable/equatable.dart';

import '../../domain/entities/info.dart';

class InfoModel extends Info with EquatableMixin {
  InfoModel({
    super.attack,
    super.defense,
    super.magic,
    super.difficulty,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
      );

  @override
  List<Object?> get props => [
        attack,
        defense,
        magic,
        difficulty,
      ];

  @override
  bool get stringify => true;
}
