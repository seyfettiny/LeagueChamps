import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/champion_detailed_model.dart';
import 'package:leaguechamps/data/models/image_model.dart';
import 'package:leaguechamps/data/models/info_model.dart';
import 'package:leaguechamps/data/models/level_tip_model.dart';
import 'package:leaguechamps/data/models/passive_model.dart';
import 'package:leaguechamps/data/models/skins_model.dart';
import 'package:leaguechamps/data/models/spells_model.dart';
import 'package:leaguechamps/domain/entities/champion_detailed.dart';

void main() {
  final ChampDetailedModel model = ChampDetailedModel(
    id: '1',
    key: 'Ahri',
    name: 'Ahri',
    title: 'the Darkin Blade',
    image: ImageModel(
      full: 'Ahri.png',
      sprite: 'champion0.png',
      group: 'champion',
      x: 0,
      y: 0,
      w: 48,
      h: 48,
    ),
    skins: <SkinsModel>[
      SkinsModel(
        id: '1',
        name: 'default',
        num: 0,
        chromas: false,
      ),
    ],
    lore: '',
    blurb:
        'Once honored defenders of Shurima against the Void, Aatrox and his brethren would become the great Kinkou, a being of the living shadow. But after centuries of imprisonment, Aatrox was the first to find redemption. He was reborn, and the cycle of bloodline and generation would continue. His own people, the Kinkou, would rise from the ashes, and take their place in the empire of Noxus. He would become the first Kinkou, and the last Aatrox.',
    info: InfoModel(
      attack: 8,
      defense: 4,
      magic: 3,
      difficulty: 4,
    ),
    allytips: ['', ''],
    enemytips: ['', ''],
    tags: ['Fighter', 'Tank'],
    partype: 'Blood Well',
    recommended: [],
    passive: PassiveModel(
      name: '',
      description: '',
      image: ImageModel(
        full: 'Aatrox.png',
        sprite: 'champion0.png',
        group: 'champion',
        x: 0,
        y: 0,
        w: 48,
        h: 48,
      ),
    ),
    spells: <SpellsModel>[
      SpellsModel(
        id: '',
        name: 'Dark Flight',
        description: '',
        image: ImageModel(
          full: 'Aatrox.png',
          sprite: 'champion0.png',
          group: 'champion',
          x: 0,
          y: 0,
          w: 48,
          h: 48,
        ),
        leveltip: LeveltipModel(
          label: ["Cooldown", "Damage", "Total AD Ratio"],
          effect: [""],
        ),
        tooltip: '',
        resource: '',
        maxrank: 1,
        cooldown: [],
        cooldownBurn: '',
        cost: [],
        costBurn: '',
        effect: [],
        effectBurn: [],
        vars: [],
        costType: '',
        maxammo: '',
        range: [],
        rangeBurn: "",
      ),
    ],
    stats: {
      "armor": 0,
      "armorperlevel": 0,
      "attackdamage": 0,
      "attackdamageperlevel": 0,
      "attackrange": 0,
      "attackspeed": 0,
      "attackspeedperlevel": 0,
      "crit": 0,
      "critperlevel": 0,
      "hp": 0,
      "hpperlevel": 0,
      "hpregen": 0,
      "hpregenperlevel": 0,
      "movespeed": 0,
      "mp": 0,
      "mpperlevel": 0,
      "mpregen": 0,
      "mpregenperlevel": 0,
      "spellblock": 0,
      "spellblockperlevel": 0,
    },
  );
  testWidgets('is subtype of champion detailed', (tester) async {
    expect(model, isA<ChampDetailed>());
  });
  group('fromJson', () {
    test('should return a valid model after fromJson', () {
      final rawJson =
          File('test/helpers/dummy_champ_detailed.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = jsonDecode(rawJson)['data']['Ahri'];
      final result = ChampDetailedModel.fromJson(jsonMap);
      expect(result, isA<ChampDetailed>());
    });
  });
  group('toString', () {
    test('should return toString method non-null', () {
      final result = model.toString();
      expect(result.length, greaterThan(0));
    });
    test('should print as String', () {
      final result = model.toString();
      expect(result, isA<String>());
    });
  });
}
