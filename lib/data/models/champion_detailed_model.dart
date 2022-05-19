import 'package:equatable/equatable.dart';

import '../../domain/entities/champion_detailed.dart';
import 'image_model.dart';
import 'info_model.dart';
import 'passive_model.dart';
import 'skins_model.dart';
import 'spells_model.dart';
import 'stats_model.dart';

class ChampDetailedModel extends ChampDetailed {
  ChampDetailedModel(
      {super.id,
      super.key,
      super.name,
      super.title,
      super.image,
      super.skins,
      super.lore,
      super.blurb,
      super.allytips,
      super.enemytips,
      super.tags,
      super.partype,
      super.info,
      super.stats,
      super.spells,
      super.passive,
      super.recommended});

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
}
