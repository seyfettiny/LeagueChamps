import 'package:hive/hive.dart';

part 'level_tip.g.dart';

@HiveType(typeId: 4)
class Leveltip extends HiveObject{
  @HiveField(0)
  List<String>? label;
  @HiveField(1)
  List<String>? effect;

  Leveltip({label, effect});
}
