import 'package:equatable/equatable.dart';

import '../../domain/entities/spells.dart';
import 'image_model.dart';
import 'level_tip_model.dart';

class SpellsModel extends Spells with EquatableMixin {
  SpellsModel(
      {super.id,
      super.name,
      super.description,
      super.tooltip,
      super.leveltip,
      super.maxrank,
      super.cooldown,
      super.cooldownBurn,
      super.cost,
      super.costBurn,
      super.effect,
      super.effectBurn,
      super.vars,
      super.costType,
      super.maxammo,
      super.range,
      super.rangeBurn,
      super.image,
      super.resource});

  factory SpellsModel.fromJson(Map<String, dynamic> json) => SpellsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        leveltip: LeveltipModel.fromJson(json["leveltip"]),
        maxrank: json["maxrank"],
        cooldown: List<double>.from(json["cooldown"].map((x) => x.toDouble())),
        cooldownBurn: json["cooldownBurn"],
        cost: List<int>.from(json["cost"].map((x) => x)),
        costBurn: json["costBurn"],
        effect: json["effect"].map((x) => x != null).toList(),
        effectBurn: json["effectBurn"].map((x) => x != null).toList(),
        vars: List<dynamic>.from(json["vars"].map((x) => x)),
        costType: json["costType"],
        maxammo: json["maxammo"],
        range: json["range"].map((x) => x).toList(),
        rangeBurn: json["rangeBurn"],
        image: ImageModel.fromJson(json["image"]),
        resource: json["resource"],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        tooltip,
        leveltip,
        maxrank,
        cooldown,
        cooldownBurn,
        cost,
        costBurn,
        effect,
        effectBurn,
        vars,
        costType,
        maxammo,
        range,
        rangeBurn,
        image,
        resource,
      ];

  @override
  bool get stringify => true;
}
