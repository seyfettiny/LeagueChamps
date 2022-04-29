import 'package:hive/hive.dart';

import 'image.dart';
import 'level_tip.dart';

part 'spells.g.dart';

@HiveType(typeId: 7)
class Spells extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? tooltip;
  @HiveField(4)
  final Leveltip? leveltip;
  @HiveField(5)
  final int? maxrank;
  @HiveField(6)
  final List<dynamic>? cooldown;
  @HiveField(7)
  final String? cooldownBurn;
  @HiveField(8)
  final List<int>? cost;
  @HiveField(9)
  final String? costBurn;
  // @HiveField(10)
  // Datavalues? datavalues;
  @HiveField(11)
  final List<dynamic>? effect;
  @HiveField(12)
  final List<dynamic>? effectBurn;
  @HiveField(13)
  final List? vars;
  @HiveField(14)
  final String? costType;
  @HiveField(15)
  final String? maxammo;
  @HiveField(16)
  final List<int>? range;
  @HiveField(17)
  final String? rangeBurn;
  @HiveField(18)
  final Image? image;
  @HiveField(19)
  final String? resource;
  Spells({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.leveltip,
    required this.maxrank,
    required this.cooldown,
    required this.cooldownBurn,
    required this.cost,
    required this.costBurn,
    required this.effect,
    required this.effectBurn,
    required this.vars,
    required this.image,
    required this.costType,
    required this.maxammo,
    required this.range,
    required this.rangeBurn,
    required this.resource,
  });
}
