import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/repositories/version_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../app/utils/connectivity_service_test.mocks.dart';
import '../data_sources/data_dragon_test.mocks.dart';
import '../data_sources/hive_service_test.mocks.dart';

@GenerateMocks([VersionRepository])
void main() {
  late VersionRepository repository;
  late MockHiveService mockHiveService;
  late MockDataDragonAPI mockDataDragonAPI;
  late MockConnectivityService mockConnectivityService;

  setUp(() {
    mockHiveService = MockHiveService();
    mockDataDragonAPI = MockDataDragonAPI();
    mockConnectivityService = MockConnectivityService();
    repository = VersionRepository(
        mockDataDragonAPI, mockHiveService, mockConnectivityService);
  });
  group('getVersion', () {
    test('should get version and save it to the Hive', () async {
      when(mockConnectivityService.hasConnection()).thenReturn(true);
      when(mockDataDragonAPI.getVersion()).thenAnswer((_) async => '9.24.1');
      when(mockHiveService.saveVersion('9.24.1')).thenAnswer((_) async => null);
      final version = await repository.getVersion();
      expect(version, '9.24.1');
    });
    test('should throw Exception when getVersion', () async {
      when(mockConnectivityService.hasConnection()).thenReturn(true);
      when(mockDataDragonAPI.getVersion())
          .thenThrow(Exception('Failed to load version'));
      expect(repository.getVersion(), throwsException);
    });
  });
}
