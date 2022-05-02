import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() => _instance;

  HiveService._internal();

  Future init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveConstants.HIVE_BOX_SETTINGS);
    await Hive.openBox(HiveConstants.HIVE_BOX_VERSION);
  }

  //[Settings Related]
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
    await getBox(boxName).clear();
  }
  //[END Box Related]
}
