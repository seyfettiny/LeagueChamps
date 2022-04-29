import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/domain/use_cases/get_version_list_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repository/version_repository_test.mocks.dart';
import 'get_version_usecase_test.mocks.dart';
@GenerateMocks([GetVersionListUseCase])
void main() {
  late MockVersionRepository mockVersionRepository;
  late GetVersionListUseCase getVersionListUseCase;

  setUp(() {
    mockVersionRepository = MockVersionRepository();
    getVersionListUseCase = GetVersionListUseCase(mockVersionRepository);
  });
  test('should return a list of versions', () async {
    when(mockVersionRepository.getVersionList()).thenAnswer((_) async => ['','']);
    final result = await getVersionListUseCase.execute();
    expect(result.length, greaterThan(0));
  });
}