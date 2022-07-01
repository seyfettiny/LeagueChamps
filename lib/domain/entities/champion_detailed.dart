import 'image.dart';
import 'info.dart';
import 'passive.dart';
import 'skins.dart';
import 'spells.dart';

class ChampDetailed {
  final String? id;
  final String? key;
  final String? name;
  final String? title;
  final Image? image;
  final List<Skins>? skins;
  final String? lore;
  final String? blurb;
  final List<String>? allytips;
  final List<String>? enemytips;
  final List<String>? tags;
  final String? partype;
  final Info? info;
  final Map? stats;
  final List<Spells>? spells;
  final Passive? passive;
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
