import 'package:hive/hive.dart';

part 'info.g.dart';

@HiveType(typeId: 3)
class Info extends HiveObject {
  @HiveField(0)
  int? attack;
  @HiveField(1)
  int? defense;
  @HiveField(2)
  int? magic;
  @HiveField(3)
  int? difficulty;

  Info({attack, defense, magic, difficulty});
}
