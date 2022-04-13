import 'package:hive_flutter/hive_flutter.dart';

import '../../app/constants.dart';
import '../models/champion.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() {
    return _instance;
  }

  HiveService._internal();

  Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ChampionAdapter());
    await Hive.openBox(AppConstants.HIVE_BOX_LANG);
    await Hive.openBox(AppConstants.HIVE_BOX_THEME);
    await Hive.openBox(AppConstants.HIVE_BOX_VERSION);
    await Hive.openBox(AppConstants.HIVE_BOX_CHAMPIONS);
  }
}
