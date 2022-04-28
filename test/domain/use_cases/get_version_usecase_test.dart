import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/domain/use_cases/get_version_usecase.dart';
import 'package:mockito/annotations.dart';

import '../repository/version_repository_test.mocks.dart';

@GenerateMocks([GetVersionUseCase])
void main() {
  MockVersionRepository mockVersionRepository;
  GetVersionUseCase getVersionUseCase;
  setUp(() {
    mockVersionRepository = MockVersionRepository();
    getVersionUseCase = GetVersionUseCase(mockVersionRepository);
  });
  
}