import 'package:hive_flutter/hive_flutter.dart';
import '../../app/constants/hive_constants.dart';

abstract class IHiveService {
  Future<void> init();
  void setDarkTheme(bool theme);
  bool isDarkTheme();
  Box getBox(String boxName);
  Future<void> openBox(String boxName);
  Future<void> closeBox(String boxName);
  Future<void> clearBox(String boxName);
}

class HiveService extends IHiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() => _instance;

  HiveService._internal();
  @override
  Future init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveConstants.HIVE_BOX_SETTINGS);
    await Hive.openBox(HiveConstants.HIVE_BOX_VERSION);
  }

  @override
  void setDarkTheme(bool theme) {
    final box = Hive.box(HiveConstants.HIVE_BOX_SETTINGS);
    box.put(HiveConstants.HIVE_KEY_THEME, theme);
  }

  @override
  bool isDarkTheme() {
    final box = Hive.box(HiveConstants.HIVE_BOX_SETTINGS);
    if (!box.containsKey(HiveConstants.HIVE_KEY_THEME)) {
      box.put(HiveConstants.HIVE_KEY_THEME, false);
    }
    return box.get(HiveConstants.HIVE_KEY_THEME);
  }
  //[END Settings Related]

  //[Box Related]
  @override
  Box getBox(String boxName) {
    return Hive.box(boxName);
  }

  @override
  Future<void> openBox(String boxName) async {
    await Hive.openBox(boxName);
  }

  @override
  Future<void> closeBox(String boxName) async {
    await getBox(boxName).close();
  }

  @override
  Future<void> clearBox(String boxName) async {
    await getBox(boxName).clear();
  }
  // //[END Box Related]
}
