import '../../domain/entities/passive.dart';
import 'image_model.dart';

class PassiveModel extends Passive {
  PassiveModel({
    super.name,
    super.description,
    super.image,
  });

  factory PassiveModel.fromJson(Map<String, dynamic> json) => PassiveModel(
        name: json["name"],
        description: json["description"],
        image: ImageModel.fromJson(json["image"]),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassiveModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          image == other.image;
  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'Passive(name: $name, description: $description, image: $image)';
  }
}
