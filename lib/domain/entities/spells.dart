import 'package:hive/hive.dart';

import 'image.dart';
import 'level_tip.dart';

part 'spells.g.dart';

@HiveType(typeId: 8)
class Spells extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? tooltip;
  @HiveField(4)
  Leveltip? leveltip;
  @HiveField(5)
  int? maxrank;
  @HiveField(6)
  List<dynamic>? cooldown;
  @HiveField(7)
  String? cooldownBurn;
  @HiveField(8)
  List<int>? cost;
  @HiveField(9)
  String? costBurn;
  // @HiveField(10)
  // Datavalues? datavalues;
  @HiveField(11)
  List<dynamic>? effect;
  @HiveField(12)
  List<dynamic>? effectBurn;
  @HiveField(13)
  List? vars;
  @HiveField(14)
  String? costType;
  @HiveField(15)
  String? maxammo;
  @HiveField(16)
  List<int>? range;
  @HiveField(17)
  String? rangeBurn;
  @HiveField(18)
  Image? image;
  @HiveField(19)
  String? resource;
  @HiveField(20)
  Spells(
      {id,
      name,
      description,
      tooltip,
      leveltip,
      maxrank,
      cooldown,
      cooldownBurn,
      cost,
      costBurn,
      //datavalues,
      effect,
      effectBurn,
      vars,
      costType,
      maxammo,
      range,
      rangeBurn,
      image,
      resource});
}
