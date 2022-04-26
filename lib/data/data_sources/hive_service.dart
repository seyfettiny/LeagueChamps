// ignore_for_file: avoid_print

import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import 'package:leaguechamps/data/models/champion_detailed_model.dart';

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
    //TODO: open box when needed
    await Hive.openBox(HiveConstants.HIVE_BOX_CHAMPDETAILED);
  }

  void _registerAdapters() {
    Hive.registerAdapter(ChampDetailedAdapter());
    Hive.registerAdapter(ChampionAdapter());
    //Hive.registerAdapter(DatavaluesAdapter());
    Hive.registerAdapter(ImageAdapter());
    Hive.registerAdapter(InfoAdapter());
    Hive.registerAdapter(LeveltipAdapter());
    Hive.registerAdapter(PassiveAdapter());
    Hive.registerAdapter(SkinsAdapter());
    Hive.registerAdapter(SpellsAdapter());
    Hive.registerAdapter(StatsAdapter());
  }

  Future<void> saveChamps(List<Champion> champs) async {
    final box = getBox(HiveConstants.HIVE_BOX_CHAMPIONS);
    var saved = 0;
    for (var champ in champs) {
      if (!box.containsKey(champ.id)) {
        await box.put(champ.id, champ);
        //TODO: remove this, just for debugging
        saved++;
      }
    }
    print('Saved $saved champions');
  }

  Future<void> saveDetailedChamp(ChampDetailed champDetailed) async {
    final box = getBox(HiveConstants.HIVE_BOX_CHAMPDETAILED);
    if (!box.containsKey(champDetailed.id.toString())) {
      //Removing null objects from effect and effectBurn lists.
      //Why effect and effectBurn lists contains null objects is explained here:
      //https://developer.riotgames.com/docs/lol#data-dragon_champions
      for (var item in champDetailed.spells!) {
        item.effect!.removeWhere((element) => item == null);
        item.effectBurn!.removeWhere((element) => item == null);
      }
      await box
          .put(champDetailed.id, champDetailed)
          .then((value) => print('Saved detailed champ: ${champDetailed.id}'))
          .onError((error, stackTrace) => throw (error!));
    } else {
      print('Champ already exists: ${champDetailed.id}');
    }
  }

  Future<void> saveVersion(String version) async {
    final box = getBox(HiveConstants.HIVE_BOX_VERSION);
    await box.put(HiveConstants.HIVE_KEY_CURRENT_VERSION, version);
  }

  Future<void> saveVersionList(List<String> versions) async {
    final box = getBox(HiveConstants.HIVE_BOX_VERSION);
    await box.put(HiveConstants.HIVE_KEY_VERSION_LIST, versions);
  }

  String getCurrentVersion() {
    final box = getBox(HiveConstants.HIVE_BOX_VERSION);
    return box.get(HiveConstants.HIVE_KEY_CURRENT_VERSION);
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
    print(box.get(HiveConstants.HIVE_KEY_THEME));
  }

  bool isDarkTheme() {
    final box = getBox(HiveConstants.HIVE_BOX_SETTINGS);
    if (!box.containsKey(HiveConstants.HIVE_KEY_THEME)) {
      box.put(HiveConstants.HIVE_KEY_THEME, false);
    }
    return box.get(HiveConstants.HIVE_KEY_THEME);
  }

  Champion getChamp(String id) {
    final box = getBox(HiveConstants.HIVE_BOX_CHAMPIONS);
    return box.get(id);
  }

  ChampDetailedModel getDetailedChamp(String id) {
    return getBox(HiveConstants.HIVE_BOX_CHAMPDETAILED).get(id);
  }

  Box getBox(String boxName) {
    return Hive.box(boxName);
  }
}
