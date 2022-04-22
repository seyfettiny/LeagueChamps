import 'package:leaguechamps/data/repositories/champion_repository.dart';

class ChampionUseCase {
  final _championRepository;
  final _hiveService;
  const ChampionUseCase(this._championRepository,this._hiveService);

  //TODO: decide whether retrieve data from cache or from network
}
