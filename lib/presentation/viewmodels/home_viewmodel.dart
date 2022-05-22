import 'package:flutter/cupertino.dart';
import '../../domain/entities/champion.dart';
import '../../domain/use_cases/get_champion_list_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  //TODO: Implement lazy loading
  final GetChampionListUseCase _getChampionListUseCase;
  HomeViewModel(this._getChampionListUseCase);

  Future<List<Champion>> getChampions(String version, Locale lang) async {
    return await _getChampionListUseCase.execute(version, lang);
  }
}