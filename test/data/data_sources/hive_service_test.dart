import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import 'package:leaguechamps/data/data_sources/hive_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hive_service_test.mocks.dart';

@GenerateMocks([
  HiveService,
  IHiveService,
  Box,
])
void main() {
  late MockIHiveService mockIHiveService;
  late HiveService hiveService;
  late MockBox mockBox;
  setUp(() async {
    hiveService = HiveService();
    mockIHiveService = MockIHiveService();
    mockBox = MockBox();
    await setUpTestHive();
    await Hive.openBox(HiveConstants.HIVE_BOX_SETTINGS);
    await Hive.openBox(HiveConstants.HIVE_BOX_VERSION);
  });
  test('should init Hive', () async {
    when(mockIHiveService.init()).thenAnswer(
        (_) async => mockIHiveService.openBox(HiveConstants.HIVE_BOX_SETTINGS));
    await hiveService.init();
    verify(mockIHiveService.init());
  });
  test('should open Box Settings', () async {
    when(mockIHiveService.openBox(HiveConstants.HIVE_BOX_SETTINGS))
        .thenAnswer((_) async => Hive.box(HiveConstants.HIVE_BOX_SETTINGS));
    await hiveService.openBox(HiveConstants.HIVE_BOX_SETTINGS);
    expect(await Hive.boxExists(HiveConstants.HIVE_BOX_SETTINGS), true);
  });
  test('should open Box Version', () async {
    when(mockIHiveService.openBox(HiveConstants.HIVE_BOX_SETTINGS)).thenAnswer((_) async => mockBox);
    await hiveService.openBox(HiveConstants.HIVE_BOX_VERSION);
    expect(await Hive.boxExists(HiveConstants.HIVE_BOX_VERSION), true);
  });
  test('should change theme', () {
    hiveService.setDarkTheme(true);
    expect(hiveService.isDarkTheme(), true);
  });

  tearDown(() async {
    await tearDownTestHive();
  });
}
