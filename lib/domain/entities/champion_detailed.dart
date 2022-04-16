import 'image.dart';
import 'info.dart';
import 'passive.dart';
import 'skins.dart';
import 'spells.dart';
import 'stats.dart';

import 'package:hive/hive.dart';

part 'champion_detailed.g.dart';

@HiveType(typeId: 0)
class ChampDetailed extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? key;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? title;
  @HiveField(4)
  Image? image;
  @HiveField(5)
  List<Skins>? skins;
  @HiveField(6)
  String? lore;
  @HiveField(7)
  String? blurb;
  @HiveField(8)
  List<dynamic>? allytips;
  @HiveField(9)
  List<dynamic>? enemytips;
  @HiveField(10)
  List<dynamic>? tags;
  @HiveField(11)
  String? partype;
  @HiveField(12)
  Info? info;
  @HiveField(13)
  Stats? stats;
  @HiveField(14)
  List<Spells>? spells;
  @HiveField(15)
  Passive? passive;
  @HiveField(16)
  List? recommended;

  ChampDetailed(
      {this.id,
      this.key,
      this.name,
      this.title,
      this.image,
      this.skins,
      this.lore,
      this.blurb,
      this.allytips,
      this.enemytips,
      this.tags,
      this.partype,
      this.info,
      this.stats,
      this.spells,
      this.passive,
      this.recommended});
}
