class AppConstants {
  static const String appName = "LeagueChamps";

  static const String championAPIBaseUrl =
      'https://ddragon.leagueoflegends.com/cdn/';

  static const String versionsUrl =
      'https://ddragon.leagueoflegends.com/api/versions.json';

  // ...Aatrox_0.jpg
  static const championSplashImageUrl =
      '$championAPIBaseUrl/${championImageRoute}splash/';
  static const championCenteredImageUrl =
      '$championAPIBaseUrl/${championImageRoute}centered/';
  static const championTileImageUrl =
      '$championAPIBaseUrl/${championImageRoute}tiles/';
  static const championLoadingImageUrl =
      '$championAPIBaseUrl/${championImageRoute}loading/';

  static const championImageRoute = '/img/champion/';
  static const championPassiveImageRoute = '/img/passive/';
  static const championSpellsImageRoute = '/img/spell/';

  // for champion spell image url
  // $championAPIBaseUrl/$version/img/passive/${champion.spells.passive.image.full}
  // $championAPIBaseUrl/$version/img/spell/${champion.spells.id}
  // for champion icon image url
  // $championAPIBaseUrl/$version/img/champion/Aatrox.png
}
