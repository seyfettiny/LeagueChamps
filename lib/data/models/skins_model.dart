// ignore_for_file: avoid_types_as_parameter_names

import 'package:equatable/equatable.dart';

import '../../domain/entities/skins.dart';

class SkinsModel extends Skins with EquatableMixin {
  SkinsModel({
    super.id,
    super.num,
    super.name,
    super.chromas,
  });

  factory SkinsModel.fromJson(Map<String, dynamic> json) => SkinsModel(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        chromas: json["chromas"],
      );

  @override
  List<Object?> get props => [
        id,
        this.num,
        name,
        chromas,
      ];

  @override
  bool get stringify => true;
}
