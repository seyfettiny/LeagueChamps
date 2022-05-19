import '../../domain/entities/level_tip.dart';

class LeveltipModel extends Leveltip {
  LeveltipModel({
    super.label,
    super.effect,
  });

  factory LeveltipModel.fromJson(Map<String, dynamic> json) => LeveltipModel(
        label: List<String>.from(json["label"].map((x) => x)),
        effect: List<String>.from(json["effect"].map((x) => x)),
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeveltipModel &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          effect == other.effect;
  @override
  int get hashCode => label.hashCode ^ effect.hashCode;

  @override
  String toString() {
    return 'Leveltip(label: $label, effect: $effect)';
  }
}
