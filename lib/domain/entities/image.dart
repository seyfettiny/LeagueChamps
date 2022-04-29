import 'package:hive/hive.dart';

part 'image.g.dart';

@HiveType(typeId: 2)
class Image extends HiveObject {
  @HiveField(0)
  final String? full;
  @HiveField(1)
  final String? sprite;
  @HiveField(2)
  final String? group;
  @HiveField(3)
  final int? x;
  @HiveField(4)
  final int? y;
  @HiveField(5)
  final int? w;
  @HiveField(6)
  final int? h;

  Image({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });
}
