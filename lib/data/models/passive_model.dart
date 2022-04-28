import '../../domain/entities/passive.dart';
import 'image_model.dart';

class PassiveModel extends Passive {
  PassiveModel({name, description, image})
      : super(name: name, description: description, image: image);

  PassiveModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }
  @override
  String toString() {
    return 'Passive(name: $name, description: $description, image: $image)';
  }
}
