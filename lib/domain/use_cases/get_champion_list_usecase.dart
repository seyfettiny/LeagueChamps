import 'package:flutter/material.dart';

import '../../data/repositories/champion_repository.dart';
import '../entities/champion.dart';

abstract class IGetChampionListUseCase {
  Future<List<Champion>> execute(String version, Locale lang);
}

class GetChampionListUseCase extends IGetChampionListUseCase {
  final ChampionRepository _championRepository;
  GetChampionListUseCase(this._championRepository);

  @override
  Future<List<Champion>> execute(String version, Locale lang) async {
    return await _championRepository.getChampions(version, lang);
  }
}
