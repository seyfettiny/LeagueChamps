import 'package:flutter/material.dart';
import '../entities/champion.dart';

abstract class IGetChampionUseCase {
  Future<Champion> execute(String champId,String version ,Locale lang);
}
class GetChampionUseCase extends IGetChampionUseCase {
  final _championRepository;
  GetChampionUseCase(this._championRepository);

  @override
  Future<Champion> execute(String champId,String version ,Locale lang) async{
    return await _championRepository.getChampion(champId, version, lang);
  }


  
}