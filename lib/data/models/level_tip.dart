class Leveltip {
  List<String>? label;
  List<String>? effect;

  Leveltip({label, effect});

  Leveltip.fromJson(Map<String, dynamic> json) {
    label = json['label'].cast<String>();
    effect = json['effect'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['effect'] = effect;
    return data;
  }
}