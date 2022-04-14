import 'package:hive/hive.dart';

part 'level_tip.g.dart';

@HiveType(typeId: 5)
class Leveltip  extends HiveObject{
  @HiveField(0)
  List<String>? label;
  @HiveField(1)
  List<String>? effect;

  Leveltip({label, effect});

  Leveltip.fromJson(Map<String, dynamic> json) {
    label = json['label'].cast<String>();
    effect = json['effect'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['effect'] = effect;
    return data;
  }
}
