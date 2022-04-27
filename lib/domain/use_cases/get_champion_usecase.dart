import '../../app/usecase/usecase.dart';
import '../entities/champion.dart';

class GetChampionUseCase extends UseCase<Champion, String> {
  final _championRepository;
  final _hiveService;
  final _versionNotifier;
  GetChampionUseCase(this._championRepository, this._hiveService, this._versionNotifier);

  @override
  Future<Champion> execute(String params) {
    // TODO: implement execute
    throw UnimplementedError();
  }


  
}