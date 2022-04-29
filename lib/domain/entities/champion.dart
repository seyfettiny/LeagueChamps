import 'image.dart';
import 'info.dart';
import 'stats.dart';
import 'package:hive/hive.dart';

part 'champion.g.dart';

@HiveType(typeId: 1)
class Champion extends HiveObject {
  @HiveField(0)
  final String? version;
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? key;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final String? title;
  @HiveField(5)
  final String? blurb;
  @HiveField(6)
  final Info? info;
  @HiveField(7)
  final Image? image;
  @HiveField(8)
  final List<String>? tags;
  @HiveField(9)
  final String? partype;
  @HiveField(10)
  final Stats? stats;

  Champion({
    required this.version,
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.info,
    required this.image,
    required this.tags,
    required this.partype,
    required this.stats,
  });
}
