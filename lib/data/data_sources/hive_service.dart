import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import 'package:leaguechamps/data/models/champion_detailed_model.dart';
import 'package:leaguechamps/data/models/champion_model.dart';

import '../../domain/entities/champion.dart';
import '../../domain/entities/champion_detailed.dart';
import '../../domain/entities/data_values.dart';
import '../../domain/entities/image.dart';
import '../../domain/entities/info.dart';
import '../../domain/entities/level_tip.dart';
import '../../domain/entities/passive.dart';
import '../../domain/entities/skins.dart';
import '../../domain/entities/spells.dart';
import '../../domain/entities/stats.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() => _instance;

  HiveService._internal();

  Future init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await Hive.openBox(HiveConstants.HIVE_BOX_SETTINGS);
    await Hive.openBox(HiveConstants.HIVE_BOX_VERSION);
    await Hive.openBox(HiveConstants.HIVE_BOX_CHAMPIONS);
    await Hive.openBox(HiveConstants.HIVE_BOX_CHAMPDETAILED);
  }

  void _registerAdapters() {
    Hive.registerAdapter(ChampDetailedAdapter());
    Hive.registerAdapter(ChampionAdapter());
    Hive.registerAdapter(DatavaluesAdapter());
    Hive.registerAdapter(ImageAdapter());
    Hive.registerAdapter(InfoAdapter());
    Hive.registerAdapter(LeveltipAdapter());
    Hive.registerAdapter(PassiveAdapter());
    Hive.registerAdapter(SkinsAdapter());
    Hive.registerAdapter(SpellsAdapter());
    Hive.registerAdapter(StatsAdapter());
  }

  Future<void> saveChamps(List<ChampionModel> champs) async {
    final box = getBox(HiveConstants.HIVE_BOX_CHAMPIONS);
    for (var champ in champs) {
      if (!box.containsKey(champ.id.toString())) {
        await box.put(champ.id.toString(), champ);
      }
    }
    print('Saved ${box.length} champions');
  }

  Future<void> saveDetailedChamp(ChampDetailedModel champDetailed) async {
    final box = getBox(HiveConstants.HIVE_BOX_CHAMPDETAILED);
    if (!box.containsKey(champDetailed.id.toString())) {
      print(champDetailed.id.toString());
      await box
          .put(champDetailed.id.toString(), champDetailed)
          .onError((error, stackTrace) => throw (error!));
      print('Saved detailed champ: ${champDetailed.id}');
    } else {
      print('Champ already exists: ${champDetailed.id}');
    }
  }

  Future<void> clearBox(String boxName) async {
    if (getBox(boxName).isEmpty) {
      print(boxName + ' is empty');
    }
    await getBox(boxName).clear();
  }

  void setDarkTheme(bool theme) {
    final box = getBox(HiveConstants.HIVE_BOX_SETTINGS);
    box.put(HiveConstants.HIVE_KEY_THEME, theme);
  }

  bool isDarkTheme() {
    final box = getBox(HiveConstants.HIVE_BOX_SETTINGS);
    if (!box.containsKey(HiveConstants.HIVE_KEY_THEME)) {
      box.put(HiveConstants.HIVE_KEY_THEME, false);
    }
    return box.get(HiveConstants.HIVE_KEY_THEME);
  }

  ChampDetailedModel getDetailedChamp(int id) {
    return getBox(HiveConstants.HIVE_BOX_CHAMPDETAILED).values.first;
  }

  Box getBox(String boxName) {
    return Hive.box(boxName);
  }
}
