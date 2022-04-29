import 'package:hive/hive.dart';

part 'info.g.dart';

@HiveType(typeId: 3)
class Info extends HiveObject {
  @HiveField(0)
  final int? attack;
  @HiveField(1)
  final int? defense;
  @HiveField(2)
  final int? magic;
  @HiveField(3)
  final int? difficulty;

  Info({
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
  });
}
