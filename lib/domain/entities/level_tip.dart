import 'package:hive/hive.dart';

part 'level_tip.g.dart';

@HiveType(typeId: 4)
class Leveltip extends HiveObject {
  @HiveField(0)
  final List<String>? label;
  @HiveField(1)
  final List<String>? effect;

  Leveltip({
    required this.label,
    required this.effect,
  });
}
