// ignore_for_file: avoid_types_as_parameter_names

import 'package:hive/hive.dart';

part 'skins.g.dart';

@HiveType(typeId: 6)
class Skins extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final int? num;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final bool? chromas;

  Skins({
    required this.id,
    required this.num,
    required this.name,
    required this.chromas,
  });
}
