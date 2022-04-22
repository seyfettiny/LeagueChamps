class AppConstants {
  static const String appName = "LeagueChamps";

  static const String championAPIBaseUrl =
      'https://ddragon.leagueoflegends.com/cdn';

  static const String versionsUrl =
      'https://ddragon.leagueoflegends.com/api/versions.json';

  // ...Aatrox_0.jpg
  static const String championSplashImageUrl =
      '$championAPIBaseUrl/img/champion/splash/';
  static const String championCenteredImageUrl =
      '$championAPIBaseUrl/img/champion/centered/';
  static const String championTileImageUrl =
      '$championAPIBaseUrl/img/champion/tiles/';
  static const String championLoadingImageUrl =
      '$championAPIBaseUrl/img/champion/loading/';

  // for champion spell image url
  // $championAPIBaseUrl/$version/img/passive/${champion.spells.passive.image.full}
  // $championAPIBaseUrl/$version/img/spell/${champion.spells.id}
  // for champion icon image url
  // $championAPIBaseUrl/$version/img/champion/Aatrox.png
}
