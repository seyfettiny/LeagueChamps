import 'package:hive/hive.dart';

import 'image.dart';
import 'info.dart';
import 'passive.dart';
import 'skins.dart';
import 'spells.dart';
import 'stats.dart';

part 'champion_detailed.g.dart';

@HiveType(typeId: 0)
class ChampDetailed extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? key;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final Image? image;
  @HiveField(5)
  final List<Skins>? skins;
  @HiveField(6)
  final String? lore;
  @HiveField(7)
  final String? blurb;
  @HiveField(8)
  final List<String>? allytips;
  @HiveField(9)
  final List<String>? enemytips;
  @HiveField(10)
  final List<String>? tags;
  @HiveField(11)
  final String? partype;
  @HiveField(12)
  final Info? info;
  @HiveField(13)
  final Stats? stats;
  @HiveField(14)
  final List<Spells>? spells;
  @HiveField(15)
  final Passive? passive;
  @HiveField(16)
  final List<dynamic>? recommended;

  ChampDetailed({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.image,
    required this.skins,
    required this.lore,
    required this.blurb,
    required this.allytips,
    required this.enemytips,
    required this.tags,
    required this.partype,
    required this.info,
    required this.stats,
    required this.spells,
    required this.passive,
    required this.recommended,
  });
}
