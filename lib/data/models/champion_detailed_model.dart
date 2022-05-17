import '../../domain/entities/champion_detailed.dart';
import 'image_model.dart';
import 'info_model.dart';
import 'passive_model.dart';
import 'skins_model.dart';
import 'spells_model.dart';
import 'stats_model.dart';

class ChampDetailedModel extends ChampDetailed {
  ChampDetailedModel(
      {id,
      key,
      name,
      title,
      image,
      skins,
      lore,
      blurb,
      allytips,
      enemytips,
      tags,
      partype,
      info,
      stats,
      spells,
      passive,
      recommended})
      : super(
          id: id,
          key: key,
          name: name,
          title: title,
          image: image,
          skins: skins,
          lore: lore,
          blurb: blurb,
          allytips: allytips,
          enemytips: enemytips,
          tags: tags,
          partype: partype,
          info: info,
          stats: stats,
          spells: spells,
          passive: passive,
          recommended: recommended,
        );

  factory ChampDetailedModel.fromJson(Map<String, dynamic> json) =>
      ChampDetailedModel(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        image: ImageModel.fromJson(json["image"]),
        skins: List<SkinsModel>.from(
            json["skins"].map((x) => SkinsModel.fromJson(x))),
        lore: json["lore"],
        blurb: json["blurb"],
        allytips: List<String>.from(json["allytips"].map((x) => x)),
        enemytips: List<String>.from(json["enemytips"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        info: InfoModel.fromJson(json["info"]),
        stats: StatsModel.fromJson(json['stats']),
        spells: List<SpellsModel>.from(
            json["spells"].map((x) => SpellsModel.fromJson(x))),
        passive: PassiveModel.fromJson(json["passive"]),
        recommended: List<dynamic>.from(json["recommended"].map((x) => x)),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChampDetailedModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          key == other.key &&
          name == other.name &&
          title == other.title &&
          image == other.image &&
          skins == other.skins &&
          lore == other.lore &&
          blurb == other.blurb &&
          allytips == other.allytips &&
          enemytips == other.enemytips &&
          tags == other.tags &&
          partype == other.partype &&
          info == other.info &&
          stats == other.stats &&
          spells == other.spells &&
          passive == other.passive &&
          recommended == other.recommended;

  @override
  int get hashCode =>
      id.hashCode ^
      key.hashCode ^
      name.hashCode ^
      title.hashCode ^
      image.hashCode ^
      skins.hashCode ^
      lore.hashCode ^
      blurb.hashCode ^
      allytips.hashCode ^
      enemytips.hashCode ^
      tags.hashCode ^
      partype.hashCode ^
      info.hashCode ^
      stats.hashCode ^
      spells.hashCode ^
      passive.hashCode ^
      recommended.hashCode;

  @override
  String toString() {
    return 'ChampDetailed(id: $id, key: $key, name: $name, title: $title, image: $image, skins: $skins, lore: $lore, blurb: $blurb, allytips: $allytips, enemytips: $enemytips, tags: $tags, partype: $partype, info: $info, stats: $stats, spells: $spells, passive: $passive, recommended: $recommended)';
  }
}
