import '../../domain/entities/skins.dart';

class SkinsModel extends Skins {
  SkinsModel({id, num, name, chromas})
      : super(id: id, num: num, name: name, chromas: chromas);

  factory SkinsModel.fromJson(Map<String, dynamic> json) => SkinsModel(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        chromas: json["chromas"],
      );

  @override
  String toString() {
    return 'Skins(id: $id, num: ${this.num}, name: $name, chromas: $chromas)';
  }
}
