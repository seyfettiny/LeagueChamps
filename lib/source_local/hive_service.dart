import 'package:hive_flutter/hive_flutter.dart';

import '../app/constants.dart';
import '../common/models/champion.dart';

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

  isExists(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(List<T> items, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);

    for (var item in items) {
      openBox.add(item);
    }
  }

  getBoxes<T>(String boxName) async {
    List<T> boxList = <T>[];

    final openBox = await Hive.openBox(boxName);

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }
}
