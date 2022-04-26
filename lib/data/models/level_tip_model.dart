import '../../domain/entities/level_tip.dart';

class LeveltipModel extends Leveltip {
  LeveltipModel({label, effect}) : super(label: label, effect: effect);

  LeveltipModel.fromJson(Map<String, dynamic> json) {
    label = json['label'].cast<String>();
    effect = json['effect'].cast<String>();
  }

  @override
  String toString() {
    return 'Leveltip(label: $label, effect: $effect)';
  }
}
