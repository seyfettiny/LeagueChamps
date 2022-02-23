class Champion {
  String? version;
  String? id;
  String? key;
  String? name;
  String? title;
  String? blurb;
  Info? info;
  Image? image;
  List<String>? tags;
  String? partype;
  Stats? stats;

  Champion(
      {this.version,
      this.id,
      this.key,
      this.name,
      this.title,
      this.blurb,
      this.info,
      this.image,
      this.tags,
      this.partype,
      this.stats});

  Champion.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    id = json['id'];
    key = json['key'];
    name = json['name'];
    title = json['title'];
    blurb = json['blurb'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    tags = json['tags'].cast<String>();
    partype = json['partype'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    data['title'] = title;
    data['blurb'] = blurb;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['tags'] = tags;
    data['partype'] = partype;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    return data;
  }
}

class Info {
  int? attack;
  int? defense;
  int? magic;
  int? difficulty;

  Info({this.attack, this.defense, this.magic, this.difficulty});

  Info.fromJson(Map<String, dynamic> json) {
    attack = json['attack'];
    defense = json['defense'];
    magic = json['magic'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attack'] = attack;
    data['defense'] = defense;
    data['magic'] = magic;
    data['difficulty'] = difficulty;
    return data;
  }
}

class Image {
  String? full;
  String? sprite;
  String? group;
  int? x;
  int? y;
  int? w;
  int? h;

  Image({this.full, this.sprite, this.group, this.x, this.y, this.w, this.h});

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
}

class Stats {
  int? hp;
  int? hpperlevel;
  int? mp;
  int? mpperlevel;
  int? movespeed;
  int? armor;
  double? armorperlevel;
  int? spellblock;
  double? spellblockperlevel;
  int? attackrange;
  int? hpregen;
  int? hpregenperlevel;
  int? mpregen;
  int? mpregenperlevel;
  int? crit;
  int? critperlevel;
  int? attackdamage;
  int? attackdamageperlevel;
  double? attackspeedperlevel;
  double? attackspeed;

  Stats(
      {this.hp,
      this.hpperlevel,
      this.mp,
      this.mpperlevel,
      this.movespeed,
      this.armor,
      this.armorperlevel,
      this.spellblock,
      this.spellblockperlevel,
      this.attackrange,
      this.hpregen,
      this.hpregenperlevel,
      this.mpregen,
      this.mpregenperlevel,
      this.crit,
      this.critperlevel,
      this.attackdamage,
      this.attackdamageperlevel,
      this.attackspeedperlevel,
      this.attackspeed});

  Stats.fromJson(Map<String, dynamic> json) {
    hp = json['hp'];
    hpperlevel = json['hpperlevel'];
    mp = json['mp'];
    mpperlevel = json['mpperlevel'];
    movespeed = json['movespeed'];
    armor = json['armor'];
    armorperlevel = json['armorperlevel'];
    spellblock = json['spellblock'];
    spellblockperlevel = json['spellblockperlevel'];
    attackrange = json['attackrange'];
    hpregen = json['hpregen'];
    hpregenperlevel = json['hpregenperlevel'];
    mpregen = json['mpregen'];
    mpregenperlevel = json['mpregenperlevel'];
    crit = json['crit'];
    critperlevel = json['critperlevel'];
    attackdamage = json['attackdamage'];
    attackdamageperlevel = json['attackdamageperlevel'];
    attackspeedperlevel = json['attackspeedperlevel'];
    attackspeed = json['attackspeed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hp'] = hp;
    data['hpperlevel'] = hpperlevel;
    data['mp'] = mp;
    data['mpperlevel'] = mpperlevel;
    data['movespeed'] = movespeed;
    data['armor'] = armor;
    data['armorperlevel'] = armorperlevel;
    data['spellblock'] = spellblock;
    data['spellblockperlevel'] = spellblockperlevel;
    data['attackrange'] = attackrange;
    data['hpregen'] = hpregen;
    data['hpregenperlevel'] = hpregenperlevel;
    data['mpregen'] = mpregen;
    data['mpregenperlevel'] = mpregenperlevel;
    data['crit'] = crit;
    data['critperlevel'] = critperlevel;
    data['attackdamage'] = attackdamage;
    data['attackdamageperlevel'] = attackdamageperlevel;
    data['attackspeedperlevel'] = attackspeedperlevel;
    data['attackspeed'] = attackspeed;
    return data;
  }
}
