import 'package:equatable/equatable.dart';

import '../../domain/entities/image.dart';

class ImageModel extends Image with EquatableMixin {
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
  List<Object?> get props => [
        full,
        sprite,
        group,
        x,
        y,
        w,
        h,
      ];

  @override
  bool get stringify => true;
}
