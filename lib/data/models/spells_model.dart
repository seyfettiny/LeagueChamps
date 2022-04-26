import 'data_values_model.dart';
import 'image_model.dart';
import 'level_tip_model.dart';
import 'package:leaguechamps/domain/entities/spells.dart';

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

  SpellsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    tooltip = json['tooltip'];
    leveltip = json['leveltip'] != null
        ? LeveltipModel.fromJson(json['leveltip'])
        : null;
    maxrank = json['maxrank'];
    cooldown = json['cooldown'];
    cooldownBurn = json['cooldownBurn'];
    cost = json['cost'].cast<int>();
    costBurn = json['costBurn'];
    // datavalues = json['datavalues'] != null
    //     ? DatavaluesModel.fromJson(json['datavalues'])
    //     : null;
    if (json['effect'] != null) {
      effect = json['effect'];
    }
    if (json['effectBurn'] != null) {
      effectBurn = json['effectBurn'];
    }
    if (json['vars'] != null) {
      vars = json['vars'];
    }
    costType = json['costType'];
    maxammo = json['maxammo'];
    range = json['range'].cast<int>();
    rangeBurn = json['rangeBurn'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    resource = json['resource'];
  }
  @override
  String toString() {
    return 'Spells(id: $id, name: $name, description: $description, tooltip: $tooltip, leveltip: $leveltip, maxrank: $maxrank, cooldown: $cooldown, cooldownBurn: $cooldownBurn, cost: $cost, costBurn: $costBurn, effect: $effect, effectBurn: $effectBurn, vars: $vars, costType: $costType, maxammo: $maxammo, range: $range, rangeBurn: $rangeBurn, image: $image, resource: $resource)';
  }
}
