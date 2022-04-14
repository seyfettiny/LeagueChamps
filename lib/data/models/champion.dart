import 'image.dart';
import 'info.dart';
import 'stats.dart';

import 'package:hive/hive.dart';

part 'champion.g.dart';

@HiveType(typeId: 1)
class Champion extends HiveObject {
  @HiveField(0)
  String? version;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? key;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? title;
  @HiveField(5)
  String? blurb;
  @HiveField(6)
  Info? info;
  @HiveField(7)
  Image? image;
  @HiveField(8)
  List<String>? tags;
  @HiveField(9)
  String? partype;
  @HiveField(10)
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
