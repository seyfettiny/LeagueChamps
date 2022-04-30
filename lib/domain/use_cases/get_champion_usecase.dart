import 'package:flutter/material.dart';

import '../../data/repositories/champion_repository.dart';
import '../entities/champion_detailed.dart';

abstract class IGetChampionUseCase {
  Future<ChampDetailed> execute(String champId, String version, Locale lang);
}

class GetChampionUseCase extends IGetChampionUseCase {
  final ChampionRepository _championRepository;
  GetChampionUseCase(this._championRepository);

  @override
  Future<ChampDetailed> execute(String champId, String version, Locale lang) async {
    return await _championRepository.getDetailedChampion(champId, version, lang);
  }
}
