import 'package:hive/hive.dart';

import 'image.dart';

part 'passive.g.dart';

@HiveType(typeId: 5)
class Passive extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final Image? image;

  Passive({
    required this.name,
    required this.description,
    required this.image,
  });
}
