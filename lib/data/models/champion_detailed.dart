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

  ChampDetailed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    title = json['title'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(Skins.fromJson(v));
      });
    }
    lore = json['lore'];
    blurb = json['blurb'];
    allytips = json['allytips'].cast<String>();
    enemytips = json['enemytips'].cast<String>();
    tags = json['tags'].cast<String>();
    partype = json['partype'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['spells'] != null) {
      spells = <Spells>[];
      json['spells'].forEach((v) {
        spells!.add(Spells.fromJson(v));
      });
    }
    passive =
        json['passive'] != null ? Passive.fromJson(json['passive']) : null;
    recommended = json['recommended'];
  }

  @override
  String toString() {
    return 'ChampDetailed(id: $id, key: $key, name: $name, title: $title, image: $image, skins: $skins, lore: $lore, blurb: $blurb, allytips: $allytips, enemytips: $enemytips, tags: $tags, partype: $partype, info: $info, stats: $stats, spells: $spells, passive: $passive, recommended: $recommended)';
  }
}
