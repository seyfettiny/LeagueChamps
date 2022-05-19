import 'package:equatable/equatable.dart';

import '../../domain/entities/passive.dart';
import 'image_model.dart';

class PassiveModel extends Passive with EquatableMixin {
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
  List<Object?> get props => [
        name,
        description,
        image,
      ];

  @override
  bool get stringify => true;
}
