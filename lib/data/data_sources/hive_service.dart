import 'package:hive_flutter/hive_flutter.dart';

import '../../app/constants.dart';
import '../models/champion.dart';
import '../models/champion_detailed.dart';
import '../models/data_values.dart';
import '../models/image.dart';
import '../models/info.dart';
import '../models/level_tip.dart';
import '../models/passive.dart';
import '../models/skins.dart';
import '../models/spells.dart';
import '../models/stats.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() {
    return _instance;
  }

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
}
