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

  ChampionModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    id = json['id'];
    key = json['key'];
    name = json['name'];
    title = json['title'];
    blurb = json['blurb'];
    info = json['info'] != null ? InfoModel.fromJson(json['info']) : null;
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    tags = json['tags'].cast<String>();
    partype = json['partype'];
    stats = json['stats'] != null ? StatsModel.fromJson(json['stats']) : null;
  }

  @override
  String toString() {
    return 'Champion(version: $version, id: $id, key: $key, name: $name, title: $title, blurb: $blurb, info: $info, image: $image, tags: $tags, partype: $partype, stats: $stats)';
  }
}
