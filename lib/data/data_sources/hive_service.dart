import 'package:hive_flutter/hive_flutter.dart';

import '../../app/constants.dart';
import '../models/champion.dart';

class HiveService {
  static HiveService? _instance;

  HiveService._();

  factory HiveService() => _instance ??= HiveService._();

  Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ChampionAdapter());
    await Hive.openBox(AppConstants.HIVE_BOX_LANG);
    await Hive.openBox(AppConstants.HIVE_BOX_THEME);
    await Hive.openBox(AppConstants.HIVE_BOX_VERSION);
    await Hive.openBox(AppConstants.HIVE_BOX_CHAMPIONS);
  }
}
