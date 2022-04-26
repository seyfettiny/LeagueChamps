import '../../domain/entities/skins.dart';

class SkinsModel extends Skins {
  SkinsModel({id, num, name, chromas})
      : super(id: id, num: num, name: name, chromas: chromas);

  SkinsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    this.num = json['num'];
    name = json['name'];
    chromas = json['chromas'];
  }

  @override
  String toString() {
    return 'Skins(id: $id, num: ${this.num}, name: $name, chromas: $chromas)';
  }
}
