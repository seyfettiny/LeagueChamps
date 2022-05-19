import '../../domain/entities/champion.dart';
import 'image_model.dart';
import 'info_model.dart';
import 'stats_model.dart';

class ChampionModel extends Champion {
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
        tags: List<String>.from(json["tags"].map((x) => x)),
        partype: json["partype"],
        stats:
            json["stats"] == null ? null : StatsModel.fromJson(json["stats"]),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChampionModel &&
          runtimeType == other.runtimeType &&
          version == other.version &&
          id == other.id &&
          key == other.key &&
          name == other.name &&
          title == other.title &&
          blurb == other.blurb &&
          info == other.info &&
          image == other.image &&
          tags == other.tags &&
          partype == other.partype &&
          stats == other.stats;

  @override
  int get hashCode =>
      version.hashCode ^
      id.hashCode ^
      key.hashCode ^
      name.hashCode ^
      title.hashCode ^
      blurb.hashCode ^
      info.hashCode ^
      image.hashCode ^
      tags.hashCode ^
      partype.hashCode ^
      stats.hashCode;

  @override
  String toString() {
    return 'Champion(version: $version, id: $id, key: $key, name: $name, title: $title, blurb: $blurb, info: $info, image: $image, tags: $tags, partype: $partype, stats: $stats)';
  }
}
