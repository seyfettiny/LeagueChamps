import 'package:flutter/material.dart' hide Image;
import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/domain/entities/champion.dart';
import 'package:leaguechamps/domain/entities/image.dart';
import 'package:leaguechamps/domain/entities/info.dart';
import 'package:leaguechamps/domain/entities/stats.dart';
import 'package:leaguechamps/domain/use_cases/get_champion_list_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repository/champion_repository_test.mocks.dart';

@GenerateMocks([GetChampionListUseCase])
void main() {
  late MockChampionRepository mockChampionRepository;
  late GetChampionListUseCase getChampionListUseCase;
  setUp(() {
    mockChampionRepository = MockChampionRepository();
    getChampionListUseCase = GetChampionListUseCase(mockChampionRepository);
  });
  const String version = '9.24.1';
  const Locale lang = Locale('en', 'US');

  final _champion = Champion(
    version: "12.8.1",
    id: "1",
    key: "Aatrox",
    name: "Aatrox",
    title: "the Darkin Blade",
    blurb:
        "Once honored defenders of Shurima against the Void, Aatrox and his brethren would become the great Kinkou, a being of the living shadow. But after centuries of imprisonment, Aatrox was the first to find redemption. He was reborn, and the cycle of bloodline and generation would continue. His own people, the Kinkou, would rise from the ashes, and take their place in the empire of Noxus. He would become the first Kinkou, and the last Aatrox.",
    info: Info(attack: 8, defense: 4, magic: 3, difficulty: 4),
    image: Image(
      full: "Aatrox.png",
      sprite: "champion0.png",
      group: "champion",
      x: 0,
      y: 0,
      w: 48,
      h: 48,
    ),
    tags: ["Fighter", "Tank"],
    partype: "Blood Well",
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
  final _result = List.generate(
    2,
    (index) => _champion,
  );
  test('should return a list of champions', () async {
    when(mockChampionRepository.getChampions(version, lang))
        .thenAnswer((_) async => _result);
    final champions = await getChampionListUseCase.execute(version, lang);
    expect(champions.length, greaterThan(0));
  });
}
