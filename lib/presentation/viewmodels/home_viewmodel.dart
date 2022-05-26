import 'package:flutter/cupertino.dart';
import '../../domain/entities/champion.dart';
import '../../domain/use_cases/get_champion_list_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  List<Champion> _champions = [];
  get champions => _champions;
  int i = 0;
  //TODO: Implement lazy loading
  final GetChampionListUseCase _getChampionListUseCase;
  HomeViewModel(this._getChampionListUseCase);

  Future<List<Champion>> getChampions(String version, Locale lang) async {
    print('home ${++i}');
    _champions = await _getChampionListUseCase.execute(version, lang);
    //notifyListeners();
    return _champions;
  }

  // Future<void> refreshChampions(String version, Locale lang) async {
  //   _champions.clear();
  //   _champions.addAll(await getChampions(version, lang));
  //   notifyListeners();
  // }
}
