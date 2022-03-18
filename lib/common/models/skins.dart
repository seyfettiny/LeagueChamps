class Skins {
  String? id;
  int? num;
  String? name;
  bool? chromas;

  Skins({id, num, name, chromas});

  Skins.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    chromas = json['chromas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['chromas'] = chromas;
    return data;
  }

  @override
  String toString() {
    return 'Skins(id: $id, num: $num, name: $name, chromas: $chromas)';
  }
}