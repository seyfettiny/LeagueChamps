import 'package:equatable/equatable.dart';

import '../../domain/entities/level_tip.dart';

class LeveltipModel extends Leveltip with EquatableMixin {
  LeveltipModel({
    super.label,
    super.effect,
  });

  factory LeveltipModel.fromJson(Map<String, dynamic> json) => LeveltipModel(
        label: List<String>.from(json["label"].map((x) => x)),
        effect: List<String>.from(json["effect"].map((x) => x)),
      );

  @override
  List<Object?> get props => [
        label,
        effect,
      ];

  @override
  bool get stringify => true;
}
