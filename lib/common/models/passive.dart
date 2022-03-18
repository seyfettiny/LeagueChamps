import 'image.dart';

class Passive {
  String? name;
  String? description;
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
}