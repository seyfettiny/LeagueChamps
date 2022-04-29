import 'package:flutter/material.dart' hide Image;
import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/domain/entities/champion_detailed.dart';
import 'package:leaguechamps/domain/entities/image.dart';
import 'package:leaguechamps/domain/entities/info.dart';
import 'package:leaguechamps/domain/entities/level_tip.dart';
import 'package:leaguechamps/domain/entities/passive.dart';
import 'package:leaguechamps/domain/entities/skins.dart';
import 'package:leaguechamps/domain/entities/spells.dart';
import 'package:leaguechamps/domain/entities/stats.dart';
import 'package:leaguechamps/domain/use_cases/get_champion_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repository/champion_repository_test.mocks.dart';

@GenerateMocks([GetChampionUseCase])
void main() {
  late MockChampionRepository mockChampionRepository;
  late GetChampionUseCase getChampionUseCase;

  setUp(() {
    mockChampionRepository = MockChampionRepository();
    getChampionUseCase = GetChampionUseCase(mockChampionRepository);
  });
  const _championName = 'Aatrox';
  const _version = '12.8.1';
  const _locale = Locale('en', 'US');

  final _champDetailed = ChampDetailed(
    id: '1',
    key: _championName,
    name: _championName,
    title: 'the Darkin Blade',
    image: Image(
      full: 'Aatrox.png',
      sprite: 'champion0.png',
      group: 'champion',
      x: 0,
      y: 0,
      w: 48,
      h: 48,
    ),
    skins: <Skins>[
      Skins(
        id: '1',
        name: 'default',
        num: 0,
        chromas: false,
      ),
    ],
    lore: '',
    blurb:
        'Once honored defenders of Shurima against the Void, Aatrox and his brethren would become the great Kinkou, a being of the living shadow. But after centuries of imprisonment, Aatrox was the first to find redemption. He was reborn, and the cycle of bloodline and generation would continue. His own people, the Kinkou, would rise from the ashes, and take their place in the empire of Noxus. He would become the first Kinkou, and the last Aatrox.',
    info: Info(
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
    passive: Passive(
      name: '',
      description: '',
      image: Image(
        full: 'Aatrox.png',
        sprite: 'champion0.png',
        group: 'champion',
        x: 0,
        y: 0,
        w: 48,
        h: 48,
      ),
    ),
    spells: <Spells>[
      Spells(
        id: '',
        name: 'Dark Flight',
        description: '',
        image: Image(
          full: 'Aatrox.png',
          sprite: 'champion0.png',
          group: 'champion',
          x: 0,
          y: 0,
          w: 48,
          h: 48,
        ),
        leveltip: Leveltip(
          label: ["Cooldown", "Damage", "Total AD Ratio"],
          effect: [],
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
        rangeBurn: '',
      ),
    ],
    stats: Stats(
      hp: 585,
      hpperlevel: 90,
      mp: 300,
      hpregen: 12,
      hpregenperlevel: 0.8,
      mpregen: 6,
      mpregenperlevel: 0.8,
      crit: 0,
      critperlevel: 0,
      attackdamage: 60,
      attackdamageperlevel: 3,
      attackspeed: -0.04,
      attackspeedperlevel: 3,
      mpperlevel: 40,
      movespeed: 345,
      armor: 36,
      armorperlevel: 3.5,
      spellblock: 32.1,
      spellblockperlevel: 1.25,
      attackrange: 150,
    ),
  );

  test('should return a championDetailed', () async {
    when(mockChampionRepository.getDetailedChampion(
            _championName, _version, _locale))
        .thenAnswer((_) async => _champDetailed);
    final result =
        await getChampionUseCase.execute(_championName, _version, _locale);
    expect(result, isA<ChampDetailed>());
  });
}
