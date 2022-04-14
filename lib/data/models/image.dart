import 'package:hive/hive.dart';

part 'image.g.dart';

@HiveType(typeId: 3)
class Image extends HiveObject {
  @HiveField(0)
  String? full;
  @HiveField(1)
  String? sprite;
  @HiveField(2)
  String? group;
  @HiveField(3)
  int? x;
  @HiveField(4)
  int? y;
  @HiveField(5)
  int? w;
  @HiveField(6)
  int? h;

  Image({full, sprite, group, x, y, w, h});

  Image.fromJson(Map<String, dynamic> json) {
    full = json['full'];
    sprite = json['sprite'];
    group = json['group'];
    x = json['x'];
    y = json['y'];
    w = json['w'];
    h = json['h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full'] = full;
    data['sprite'] = sprite;
    data['group'] = group;
    data['x'] = x;
    data['y'] = y;
    data['w'] = w;
    data['h'] = h;
    return data;
  }

  @override
  String toString() {
    return 'Image(full: $full, sprite: $sprite, group: $group, x: $x, y: $y, w: $w, h: $h)';
  }
}
