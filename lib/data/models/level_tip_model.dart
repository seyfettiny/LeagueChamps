import '../../domain/entities/level_tip.dart';

class LeveltipModel extends Leveltip {
  LeveltipModel({label, effect}) : super(label: label, effect: effect);

    factory LeveltipModel.fromJson(Map<String, dynamic> json) => LeveltipModel(
        label: List<String>.from(json["label"].map((x) => x)),
        effect: List<String>.from(json["effect"].map((x) => x)),
    );

  @override
  String toString() {
    return 'Leveltip(label: $label, effect: $effect)';
  }
}
