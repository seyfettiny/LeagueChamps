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

  Passive.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
  // Hive fields go here
}
