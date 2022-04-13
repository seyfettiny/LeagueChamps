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
