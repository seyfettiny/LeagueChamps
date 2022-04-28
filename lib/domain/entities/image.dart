import 'package:hive/hive.dart';

part 'image.g.dart';

@HiveType(typeId: 2)
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
}
