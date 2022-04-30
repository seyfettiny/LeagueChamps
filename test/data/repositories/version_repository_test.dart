import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/repositories/version_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../data_sources/data_dragon_test.mocks.dart';

@GenerateMocks([VersionRepository])
void main() {
  late VersionRepository repository;
  late MockDataDragonAPI mockDataDragonAPI;

  setUp(() {
    mockDataDragonAPI = MockDataDragonAPI();
    repository = VersionRepository(
        mockDataDragonAPI);
  });
  group('getVersion', () {
    test('should get version and save it to the Hive', () async {
      when(mockDataDragonAPI.getVersion()).thenAnswer((_) async => '9.24.1');
      final version = await repository.getVersion();
      expect(version, '9.24.1');
    });
    test('should throw Exception when getVersion', () async {
      when(mockDataDragonAPI.getVersion())
          .thenThrow(Exception('Failed to load version'));
      expect(repository.getVersion(), throwsException);
    });
  });
}
