import 'image.dart';
import 'info.dart';
import 'stats.dart';

class Champion {
  String? version;
  String? id;
  String? key;
  String? name;
  String? title;
  String? blurb;
  Info? info;
  Image? image;
  List<String>? tags;
  String? partype;
  Stats? stats;

  Champion(
      {this.version,
      this.id,
      this.key,
      this.name,
      this.title,
      this.blurb,
      this.info,
      this.image,
      this.tags,
      this.partype,
      this.stats});

  Champion.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    id = json['id'];
    key = json['key'];
    name = json['name'];
    title = json['title'];
    blurb = json['blurb'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    tags = json['tags'].cast<String>();
    partype = json['partype'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    data['title'] = title;
    data['blurb'] = blurb;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['tags'] = tags;
    data['partype'] = partype;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    return data;
  }
}