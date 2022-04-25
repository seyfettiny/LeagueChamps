// ignore_for_file: avoid_types_as_parameter_names

import 'package:hive/hive.dart';

part 'skins.g.dart';

@HiveType(typeId: 7)
class Skins extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  int? num;
  @HiveField(2)
  String? name;
  @HiveField(3)
  bool? chromas;

  Skins({id, num, name, chromas});
}
