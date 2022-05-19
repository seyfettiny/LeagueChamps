import 'image.dart';
import 'info.dart';
import 'stats.dart';

class Champion {
  final String? version;
  final String? id;
  final String? key;
  final String? name;
  final String? title;
  final String? blurb;
  final Info? info;
  final Image? image;
  final List<String>? tags;
  final String? partype;
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
