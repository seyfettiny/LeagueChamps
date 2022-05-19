import '../../domain/entities/image.dart';

class ImageModel extends Image {
  ImageModel({
    super.full,
    super.sprite,
    super.group,
    super.x,
    super.y,
    super.w,
    super.h,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        full: json["full"],
        sprite: json["sprite"],
        group: json["group"],
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageModel &&
          runtimeType == other.runtimeType &&
          full == other.full &&
          sprite == other.sprite &&
          group == other.group &&
          x == other.x &&
          y == other.y &&
          w == other.w &&
          h == other.h;
  @override
  int get hashCode =>
      full.hashCode ^
      sprite.hashCode ^
      group.hashCode ^
      x.hashCode ^
      y.hashCode ^
      w.hashCode ^
      h.hashCode;

  @override
  String toString() {
    return 'Image(full: $full, sprite: $sprite, group: $group, x: $x, y: $y, w: $w, h: $h)';
  }
}
