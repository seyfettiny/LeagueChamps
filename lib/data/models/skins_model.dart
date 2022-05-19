import '../../domain/entities/skins.dart';

class SkinsModel extends Skins {
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkinsModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          this.num == other.num &&
          name == other.name &&
          chromas == other.chromas;

  @override
  int get hashCode =>
      id.hashCode ^ this.num.hashCode ^ name.hashCode ^ chromas.hashCode;

  @override
  String toString() {
    return 'Skins(id: $id, num: ${this.num}, name: $name, chromas: $chromas)';
  }
}
