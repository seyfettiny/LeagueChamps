class ChampDetailed {
  String? id;
  String? key;
  String? name;
  String? title;
  Image? image;
  List<Skins>? skins;
  String? lore;
  String? blurb;
  late List<dynamic> allytips;
  late List<dynamic> enemytips;
  late List<dynamic> tags;
  String? partype;
  Info? info;
  Stats? stats;
  List<Spells>? spells;
  Passive? passive;
  List? recommended;

  ChampDetailed(
      {id,
      key,
      name,
      title,
      image,
      skins,
      lore,
      blurb,
      allytips,
      enemytips,
      tags,
      partype,
      info,
      stats,
      spells,
      passive,
      recommended});

  ChampDetailed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    title = json['title'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(Skins.fromJson(v));
      });
    }
    lore = json['lore'];
    blurb = json['blurb'];
    allytips = json['allytips'];
    enemytips = json['enemytips'];
    tags = json['tags'];
    partype = json['partype'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['spells'] != null) {
      spells = <Spells>[];
      json['spells'].forEach((v) {
        spells!.add(Spells.fromJson(v));
      });
    }
    passive =
        json['passive'] != null ? Passive.fromJson(json['passive']) : null;
    recommended = json['recommended'];
  }

  @override
  String toString() {
    return 'ChampDetailed(id: $id, key: $key, name: $name, title: $title, image: $image, skins: $skins, lore: $lore, blurb: $blurb, allytips: $allytips, enemytips: $enemytips, tags: $tags, partype: $partype, info: $info, stats: $stats, spells: $spells, passive: $passive, recommended: $recommended)';
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

class Info {
  int? attack;
  int? defense;
  int? magic;
  int? difficulty;

  Info({attack, defense, magic, difficulty});

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

class Stats {
  num? hp;
  num? hpperlevel;
  num? mp;
  num? mpperlevel;
  num? movespeed;
  num? armor;
  num? armorperlevel;
  num? spellblock;
  num? spellblockperlevel;
  num? attackrange;
  num? hpregen;
  num? hpregenperlevel;
  num? mpregen;
  num? mpregenperlevel;
  num? crit;
  num? critperlevel;
  num? attackdamage;
  num? attackdamageperlevel;
  num? attackspeedperlevel;
  num? attackspeed;

  Stats(
      {hp,
      hpperlevel,
      mp,
      mpperlevel,
      movespeed,
      armor,
      armorperlevel,
      spellblock,
      spellblockperlevel,
      attackrange,
      hpregen,
      hpregenperlevel,
      mpregen,
      mpregenperlevel,
      crit,
      critperlevel,
      attackdamage,
      attackdamageperlevel,
      attackspeedperlevel,
      attackspeed});

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

class Datavalues {
  Datavalues();

  Datavalues.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Passive {
  String? name;
  String? description;
  Image? image;

  Passive({name, description, image});

  Passive.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
