import '../../app/usecase/usecase.dart';
import '../entities/champion.dart';

class GetChampionListUseCase extends UseCase<List<Champion>, String> {
  final _championRepository;
  final _hiveService;
  final _versionNotifier;
  GetChampionListUseCase(
      this._championRepository, this._hiveService, this._versionNotifier);

  @override
  Future<List<Champion>> execute(String params) {
    // TODO: implement execute

    throw UnimplementedError();
  }
}
