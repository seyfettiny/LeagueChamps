import 'data_values.dart';
import 'image.dart';
import 'level_tip.dart';

class Spells {
  String? id;
  String? name;
  String? description;
  String? tooltip;
  Leveltip? leveltip;
  int? maxrank;
  List<int>? cooldown;
  String? cooldownBurn;
  List<int>? cost;
  String? costBurn;
  Datavalues? datavalues;
  List? effect;
  List? effectBurn;
  List? vars;
  String? costType;
  String? maxammo;
  List<int>? range;
  String? rangeBurn;
  Image? image;
  String? resource;

  Spells(
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
      datavalues,
      effect,
      effectBurn,
      vars,
      costType,
      maxammo,
      range,
      rangeBurn,
      image,
      resource});

  Spells.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    tooltip = json['tooltip'];
    leveltip =
        json['leveltip'] != null ? Leveltip.fromJson(json['leveltip']) : null;
    maxrank = json['maxrank'];
    cooldown = json['cooldown'].cast<int>();
    cooldownBurn = json['cooldownBurn'];
    cost = json['cost'].cast<int>();
    costBurn = json['costBurn'];
    datavalues = json['datavalues'] != null
        ? Datavalues.fromJson(json['datavalues'])
        : null;
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
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    resource = json['resource'];
  }
}