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

  ChampDetailedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    title = json['title'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    if (json['skins'] != null) {
      skins = <SkinsModel>[];
      json['skins'].forEach((v) {
        skins!.add(SkinsModel.fromJson(v));
      });
    }
    lore = json['lore'];
    blurb = json['blurb'];
    allytips = json['allytips'].cast<String>();
    enemytips = json['enemytips'].cast<String>();
    tags = json['tags'].cast<String>();
    partype = json['partype'];
    info = json['info'] != null ? InfoModel.fromJson(json['info']) : null;
    stats = json['stats'] != null ? StatsModel.fromJson(json['stats']) : null;
    if (json['spells'] != null) {
      spells = <SpellsModel>[];
      json['spells'].forEach((v) {
        spells!.add(SpellsModel.fromJson(v));
      });
    }
    passive =
        json['passive'] != null ? PassiveModel.fromJson(json['passive']) : null;
    recommended = json['recommended'];
  }

  @override
  String toString() {
    return 'ChampDetailed(id: $id, key: $key, name: $name, title: $title, image: $image, skins: $skins, lore: $lore, blurb: $blurb, allytips: $allytips, enemytips: $enemytips, tags: $tags, partype: $partype, info: $info, stats: $stats, spells: $spells, passive: $passive, recommended: $recommended)';
  }
}
