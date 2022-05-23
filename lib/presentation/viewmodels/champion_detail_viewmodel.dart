import 'package:flutter/cupertino.dart';
import 'package:leaguechamps/domain/entities/champion_detailed.dart';
import 'package:leaguechamps/domain/use_cases/get_champion_usecase.dart';

class ChampionDetailViewModel extends ChangeNotifier {
  final GetChampionUseCase getChampionUseCase;
  ChampionDetailViewModel(this.getChampionUseCase);

  Future<ChampDetailed> getChampion(
      String champId, String version, Locale lang) async {
    return await getChampionUseCase.execute(champId, version, lang);
  }
}
