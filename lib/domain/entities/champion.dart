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
}
