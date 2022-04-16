import 'package:leaguechamps/domain/entities/image.dart';

class ImageModel extends Image {
  ImageModel({full, sprite, group, x, y, w, h})
      : super(full: full, sprite: sprite, group: group, x: x, y: y, w: w, h: h);

  ImageModel.fromJson(Map<String, dynamic> json) {
    full = json['full'];
    sprite = json['sprite'];
    group = json['group'];
    x = json['x'];
    y = json['y'];
    w = json['w'];
    h = json['h'];
  }

  @override
  String toString() {
    return 'Image(full: $full, sprite: $sprite, group: $group, x: $x, y: $y, w: $w, h: $h)';
  }
}
