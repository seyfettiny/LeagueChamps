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

  Skins.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    chromas = json['chromas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['chromas'] = chromas;
    return data;
  }

  @override
  String toString() {
    return 'Skins(id: $id, num: $num, name: $name, chromas: $chromas)';
  }
  // Hive fields go here
}
