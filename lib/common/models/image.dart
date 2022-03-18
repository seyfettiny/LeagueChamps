class Image {
  String? full;
  String? sprite;
  String? group;
  int? x;
  int? y;
  int? w;
  int? h;

  Image({full, sprite, group, x, y, w, h});

  Image.fromJson(Map<String, dynamic> json) {
    full = json['full'];
    sprite = json['sprite'];
    group = json['group'];
    x = json['x'];
    y = json['y'];
    w = json['w'];
    h = json['h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full'] = full;
    data['sprite'] = sprite;
    data['group'] = group;
    data['x'] = x;
    data['y'] = y;
    data['w'] = w;
    data['h'] = h;
    return data;
  }

  @override
  String toString() {
    return 'Image(full: $full, sprite: $sprite, group: $group, x: $x, y: $y, w: $w, h: $h)';
  }
}