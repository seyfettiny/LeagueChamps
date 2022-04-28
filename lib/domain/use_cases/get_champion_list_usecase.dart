import 'package:flutter/material.dart';

import '../entities/champion.dart';

abstract class IGetChampionListUseCase {
  Future<List<Champion>> execute(String champId, String version, Locale lang);
}

class GetChampionListUseCase extends IGetChampionListUseCase {
  final _championRepository;
  GetChampionListUseCase(this._championRepository);

  @override
  Future<List<Champion>> execute(
      String champId, String version, Locale lang) async {
    return await _championRepository.getChampionList(champId, version, lang);
  }
}
