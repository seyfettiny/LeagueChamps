import 'package:flutter/cupertino.dart';
import 'package:leaguechamps/domain/entities/champion.dart';
import 'package:leaguechamps/domain/use_cases/get_champion_list_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final GetChampionListUseCase _getChampionListUseCase;
  HomeViewModel(this._getChampionListUseCase);

  Future<List<Champion>> getChampions(String version, Locale lang) async {
    return await _getChampionListUseCase.execute(version, lang);
  }
}