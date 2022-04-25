class AppConstants {
  static const String appName = "LeagueChamps";

  static const String championAPIBaseUrl =
      'https://ddragon.leagueoflegends.com/cdn/';

  static const String versionsUrl =
      'https://ddragon.leagueoflegends.com/api/versions.json';

  // ...Aatrox_0.jpg
  static const championSplashImageUrl =
      '${championAPIBaseUrl}img/champion/splash/';
  static const championCenteredImageUrl =
      '${championAPIBaseUrl}img/champion/centered/';
  static const championTileImageUrl =
      '${championAPIBaseUrl}img/champion/tiles/';
  static const championLoadingImageUrl =
      '${championAPIBaseUrl}img/champion/loading/';

  static const championPassiveImageRoute = '/img/passive/';
  static const championSpellsImageRoute = '/img/spell/';
  static const championSquareImageRoute = '/img/champion/';

  // for champion spell image url
  // $championAPIBaseUrl/$version/img/passive/${champion.spells.passive.image.full}
  // $championAPIBaseUrl/$version/img/spell/${champion.spells.id}
  // for champion icon image url
  // $championAPIBaseUrl/$version/img/champion/Aatrox.png
}
