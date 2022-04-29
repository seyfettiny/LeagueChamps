import '../../domain/entities/spells.dart';

import 'image_model.dart';
import 'level_tip_model.dart';

class SpellsModel extends Spells {
  SpellsModel(
      {id,
      name,
      description,
      tooltip,
      leveltip,
      maxrank,
      cooldown,
      cooldownBurn,
      cost,
      costBurn,
      //datavalues,
      effect,
      effectBurn,
      vars,
      costType,
      maxammo,
      range,
      rangeBurn,
      image,
      resource})
      : super(
          id: id,
          name: name,
          description: description,
          tooltip: tooltip,
          leveltip: leveltip,
          maxrank: maxrank,
          cooldown: cooldown,
          cooldownBurn: cooldownBurn,
          cost: cost,
          costBurn: costBurn,
          //datavalues: datavalues,
          effect: effect,
          effectBurn: effectBurn,
          vars: vars,
          costType: costType,
          maxammo: maxammo,
          range: range,
          rangeBurn: rangeBurn,
          image: image,
          resource: resource,
        );

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
        effect: List<List<int>>.from(json["effect"].map((x) => x == null ? null : List<int>.from(x.map((x) => x)))),
        effectBurn: List<String>.from(json["effectBurn"].map((x) => x == null ? null : x)),
        vars: List<dynamic>.from(json["vars"].map((x) => x)),
        costType: json["costType"],
        maxammo: json["maxammo"],
        range: List<int>.from(json["range"].map((x) => x)),
        rangeBurn: json["rangeBurn"],
        image: ImageModel.fromJson(json["image"]),
        resource: json["resource"],
    );
  @override
  String toString() {
    return 'Spells(id: $id, name: $name, description: $description, tooltip: $tooltip, leveltip: $leveltip, maxrank: $maxrank, cooldown: $cooldown, cooldownBurn: $cooldownBurn, cost: $cost, costBurn: $costBurn, effect: $effect, effectBurn: $effectBurn, vars: $vars, costType: $costType, maxammo: $maxammo, range: $range, rangeBurn: $rangeBurn, image: $image, resource: $resource)';
  }
}
