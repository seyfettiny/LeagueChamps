import 'package:hive_flutter/hive_flutter.dart';

import '../../app/constants.dart';
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
    await Hive.openBox(AppConstants.HIVE_BOX_LANG);
    await Hive.openBox(AppConstants.HIVE_BOX_THEME);
    await Hive.openBox(AppConstants.HIVE_BOX_VERSION);
    await Hive.openBox(AppConstants.HIVE_BOX_CHAMPIONS);
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

  void saveChamps(List<Champion> champs) {
    final box = Hive.box(AppConstants.HIVE_BOX_CHAMPIONS);
    for (var champ in champs) {
      box.put(champ.id, champ);
    }
  }

  void setDarkTheme(bool theme) {
    final box = Hive.box(AppConstants.HIVE_BOX_THEME);
    box.put(AppConstants.HIVE_KEY_THEME, theme);
  }

  bool isDarkTheme() {
    final box = Hive.box(AppConstants.HIVE_BOX_THEME);
    if (box.isEmpty) {
      box.put(AppConstants.HIVE_KEY_THEME, false);
    }
    return box.get(AppConstants.HIVE_KEY_THEME);
  }
}
