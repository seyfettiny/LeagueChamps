import 'package:flutter/cupertino.dart';
class AppConstants {
  static const String appName = "LOL Wiki";

  //TODO: Extract version number and language code to separate file
  static const String championAPIBaseUrl = 'https://ddragon.leagueoflegends.com/cdn/12.5.1/data/';

  static const String versionsUrl = 'https://ddragon.leagueoflegends.com/api/versions.json';

  // ...Aatrox_0.jpg
  static const String championSplashImageUrl = 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/';
  static const String championCenteredImageUrl = 'https://ddragon.leagueoflegends.com/cdn/img/champion/centered/';
  static const String championTileImageUrl = 'https://ddragon.leagueoflegends.com/cdn/img/champion/tiles/';
  static const String championLoadingImageUrl = 'https://ddragon.leagueoflegends.com/cdn/img/champion/loading/';
  
  // .../$VERSION/img/champion/Aatrox.png
  static const String championIconImageUrl = 'https://ddragon.leagueoflegends.com/cdn/';

  static const String HIVE_BOX_LANG = 'lang';
  static const String HIVE_BOX_THEME = 'theme';

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('cs', 'CZ'),
    Locale('de', 'DE'),
    Locale('el', 'GR'),
    Locale('en', 'AU'),
    Locale('en', 'GB'),
    Locale('en', 'PH'),
    Locale('en', 'SG'),
    Locale('es', 'AR'),
    Locale('es', 'ES'),
    Locale('es', 'MX'),
    Locale('fr', 'FR'),
    Locale('hu', 'HU'),
    Locale('id', 'ID'),
    Locale('it', 'IT'),
    Locale('ja', 'JP'),
    Locale('ko', 'KR'),
    Locale('pl', 'PL'),
    Locale('pt', 'BR'),
    Locale('ro', 'RO'),
    Locale('ru', 'RU'),
    Locale('th', 'TH'),
    Locale('tr', 'TR'),
    Locale('vn', 'VN'),
    Locale('zh', 'CN'),
    Locale('zh', 'MY'),
    Locale('zh', 'TW')
  ];

}