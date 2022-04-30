import 'image.dart';
import 'level_tip.dart';

class Spells {
  final String? id;
  final String? name;
  final String? description;
  final String? tooltip;
  final Leveltip? leveltip;
  final int? maxrank;
  final List<dynamic>? cooldown;
  final String? cooldownBurn;
  final List<dynamic>? cost;
  final String? costBurn;
  final List<dynamic>? effect;
  final List<dynamic>? effectBurn;
  final List<dynamic>? vars;
  final String? costType;
  final String? maxammo;
  final List<dynamic>? range;
  final String? rangeBurn;
  final Image? image;
  final String? resource;
  Spells({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.leveltip,
    required this.maxrank,
    required this.cooldown,
    required this.cooldownBurn,
    required this.cost,
    required this.costBurn,
    required this.effect,
    required this.effectBurn,
    required this.vars,
    required this.image,
    required this.costType,
    required this.maxammo,
    required this.range,
    required this.rangeBurn,
    required this.resource,
  });
}
