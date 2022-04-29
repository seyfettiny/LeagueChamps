import '../../domain/entities/champion.dart';
import 'image_model.dart';
import 'info_model.dart';
import 'stats_model.dart';

class ChampionModel extends Champion {
  ChampionModel(
      {version, id, key, name, title, blurb, info, image, tags, partype, stats})
      : super(
            version: version,
            id: id,
            key: key,
            name: name,
            title: title,
            blurb: blurb,
            info: info,
            image: image,
            tags: tags,
            partype: partype,
            stats: stats);

  factory ChampionModel.fromJson(Map<String, dynamic> json) => ChampionModel(
        version: json["version"],
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        blurb: json["blurb"],
        info: InfoModel.fromJson(json["info"]),
        image: ImageModel.fromJson(json["image"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        stats:
            json["stats"] == null ? null : StatsModel.fromJson(json["stats"]),
      );

  @override
  String toString() {
    return 'Champion(version: $version, id: $id, key: $key, name: $name, title: $title, blurb: $blurb, info: $info, image: $image, tags: $tags, partype: $partype, stats: $stats)';
  }
}
