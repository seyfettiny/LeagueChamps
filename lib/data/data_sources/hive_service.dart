// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import 'package:leaguechamps/data/models/champion_detailed_model.dart';

import '../../domain/entities/champion.dart';
import '../../domain/entities/champion_detailed.dart';
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
    //await Hive.openBox(HiveConstants.HIVE_BOX_CHAMPIONS);
    //TODO: open box when needed. With that we can use box.compact and box.close
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

  //[Version Related]
  Future<void> saveVersion(String version) async {
    final box = getBox(HiveConstants.HIVE_BOX_VERSION);
    await box.put(HiveConstants.HIVE_KEY_CURRENT_VERSION, version);
  }

  Future<void> saveVersionList(List<dynamic> versions) async {
    final box = getBox(HiveConstants.HIVE_BOX_VERSION);
    await box.put(HiveConstants.HIVE_KEY_VERSION_LIST, versions);
  }

  String getCurrentVersion() {
    final box = getBox(HiveConstants.HIVE_BOX_VERSION);
    return box.get(HiveConstants.HIVE_KEY_CURRENT_VERSION) ?? '';
  }

  List<dynamic> getVersionList() {
    final box = getBox(HiveConstants.HIVE_BOX_VERSION);
    return box.get(HiveConstants.HIVE_KEY_VERSION_LIST) ?? [];
  }
  //[END Version Related]

  //[Champion Related]
  Future<void> saveChampions(
      {required String version,
      required Locale lang,
      required List<Champion> champions}) async {
    final box =
        getBox(HiveConstants.HIVE_BOX_CHAMPIONS + version + lang.toString());
    !box.isOpen ? await Hive.openBox(box.name) : null;
    var saved = 0;
    for (var champ in champions) {
      if (!box.containsKey(champ.id! + version + lang.toString())) {
        await box.put(
          champ.id! + version + lang.toString(),
          champ,
        );
        //TODO: remove this, just for debugging
        saved++;
      }
    }
    print('Saved $saved champions');
  }

  Future<void> saveDetailedChamp(
      {required String version,
      required Locale lang,
      required ChampDetailed champDetailed}) async {
    final box = getBox(HiveConstants.HIVE_BOX_CHAMPDETAILED);
    if (!box.containsKey(champDetailed.id! + version + lang.toString())) {
      //Removing null objects from effect and effectBurn lists.
      //Why effect and effectBurn lists does contain null objects explained here:
      //https://developer.riotgames.com/docs/lol#data-dragon_champions
      for (var item in champDetailed.spells!) {
        item.effect!.removeWhere((element) => item == null);
        item.effectBurn!.removeWhere((element) => item == null);
      }
      await box
          .put(champDetailed.id! + version + lang.toString(), champDetailed)
          .then((value) => print('Saved detailed champ: ${champDetailed.id}'))
          .onError((error, stackTrace) => throw (error!));
    } else {
      print('Champ already exists: ${champDetailed.id}');
    }
  }

  Future<List<Champion>> getChampions(String version, Locale lang) async {
    final box = await getBox(
        HiveConstants.HIVE_BOX_CHAMPIONS + version + lang.toString());
    return box.values.toList().cast<Champion>();
  }

  Champion getChamp(String id) {
    final box = getBox(HiveConstants.HIVE_BOX_CHAMPIONS);
    return box.get(id);
  }

  Future<ChampDetailedModel> getDetailedChamp(
      String id, String version, Locale lang) async {
    return await getBox(
            HiveConstants.HIVE_BOX_CHAMPDETAILED + version + lang.toString())
        .get(id);
  }
  //[END Champion Related]

  //[Settings Related]
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
  //[END Settings Related]

  //[Box Related]
  Box getBox(String boxName) {
    return Hive.box(boxName);
  }

  Future<void> openBox(String boxName) async {
    await Hive.openBox(boxName);
  }

  Future<void> closeBox(String boxName) async {
    await getBox(boxName).close();
  }

  Future<void> clearBox(String boxName) async {
    if (getBox(boxName).isEmpty) {
      print(boxName + ' is empty');
    }
    await getBox(boxName).clear();
  }
  //[END Box Related]
}
