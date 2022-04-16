import 'image.dart';
import 'package:hive/hive.dart';

part 'passive.g.dart';

@HiveType(typeId: 6)
class Passive extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? description;
  @HiveField(2)
  Image? image;

  Passive({name, description, image});
}
