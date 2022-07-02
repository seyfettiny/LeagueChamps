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

  static const championImageRoute = '/img/champion/';
  static const championPassiveImageRoute = '/img/passive/';
  static const championSpellsImageRoute = '/img/spell/';

  // for champion spell image url
  // $championAPIBaseUrl/$version/img/passive/${champion.spells.passive.image.full}
  // $championAPIBaseUrl/$version/img/spell/${champion.spells.id}
  // for champion icon image url
  // $championAPIBaseUrl/$version/img/champion/Aatrox.png

  //TODO: this should localized
  static const stats = {
    "armor": "Armor",
    "armorperlevel": "Armor per Level",
    "attackdamage": "Attack Damage",
    "attackdamageperlevel": "Attack Damage per Level",
    "attackrange": "Attack Range",
    "attackspeed": "Attack Speed",
    "attackspeedperlevel": "Attack Speed per Level",
    "crit": "Critical Strike Chance",
    "critperlevel": "Critical Strike Chance per Level",
    "hp": "Health",
    "hpperlevel": "Health per Level",
    "hpregen": "Health Regeneration",
    "hpregenperlevel": "Health Regeneration per Level",
    "movespeed": "Movement Speed",
    "mp": "Mana",
    "mpperlevel": "Mana per Level",
    "mpregen": "Mana Regeneration",
    "mpregenperlevel": "Mana Regeneration per Level",
    "spellblock": "Spell Block",
    "spellblockperlevel": "Spell Block per Level",
  };
}
