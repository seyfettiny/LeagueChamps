import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/domain/use_cases/get_version_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repository/version_repository_test.mocks.dart';

@GenerateMocks([GetVersionUseCase])
void main() {
  late MockVersionRepository mockVersionRepository;
  late GetVersionUseCase getVersionUseCase;
  const _version = '1.0.0';
  setUp(() {
    mockVersionRepository = MockVersionRepository();
    getVersionUseCase = GetVersionUseCase(mockVersionRepository);
  });
  test('should return version as String', () async{
    when(mockVersionRepository.getVersion()).thenAnswer((_) async => _version);
    expect(await getVersionUseCase.execute(), isA<String>());
  });
}