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
    test('should get version', () async {
      when(mockDataDragonAPI.getVersion()).thenAnswer((_) async => '9.24.1');
      final version = await repository.getVersion();
      expect(version, '9.24.1');
    });
    test('should throw Exception when getVersion', () async {
      when(mockDataDragonAPI.getVersion())
          .thenThrow(Exception());
      expect(repository.getVersion(), throwsException);
    });
  });
  group('getVersionList', () {
        test('should get list of version', () async {
      when(mockDataDragonAPI.getVersionList()).thenAnswer((_) async => ['9.24.1', '9.24.0']);
      final version = await repository.getVersionList();
      expect(version, ['9.24.1', '9.24.0']);
    });
    test('should throw Exception when getVersionList', () async {
      when(mockDataDragonAPI.getVersionList())
          .thenThrow(Exception());
      expect(repository.getVersionList(), throwsException);
    });
  });
}
