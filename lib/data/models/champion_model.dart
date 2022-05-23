import 'package:equatable/equatable.dart';

import '../../domain/entities/champion.dart';
import 'image_model.dart';
import 'info_model.dart';
import 'stats_model.dart';

class ChampionModel extends Champion with EquatableMixin {
  ChampionModel({
    super.version,
    super.id,
    super.key,
    super.name,
    super.title,
    super.blurb,
    super.info,
    super.image,
    super.tags,
    super.partype,
    super.stats,
  });

  factory ChampionModel.fromJson(Map<String, dynamic> json) => ChampionModel(
        version: json["version"],
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        blurb: json["blurb"],
        info: InfoModel.fromJson(json["info"]),
        image: ImageModel.fromJson(json["image"]),
        tags: json['tags'].cast<String>(),
        partype: json["partype"],
        stats:
            json["stats"] == null ? null : StatsModel.fromJson(json["stats"]),
      );

  @override
  List<Object?> get props => [
        version,
        id,
        key,
        name,
        title,
        blurb,
        info,
        image,
        tags,
        partype,
        stats,
      ];

  @override
  bool get stringify => true;
}
