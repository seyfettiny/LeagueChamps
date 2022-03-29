import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lolwiki/app/constants.dart';
import 'package:lolwiki/app/enum_champ_class.dart';
import 'package:lolwiki/domain/repository/champion_repository/champion_repository.dart';
import 'package:lolwiki/ui/notifiers/lang_notifier.dart';
import 'package:lolwiki/ui/notifiers/theme_notifier.dart';
import 'package:lolwiki/ui/themes/dark_theme.dart';
import 'package:lolwiki/ui/themes/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'generated/locale_keys.g.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.HIVE_BOX_LANG);
  await Hive.openBox(AppConstants.HIVE_BOX_THEME);
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      //TODO: Extract providers to seperate folder
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(lightTheme),
        ),
        ChangeNotifierProvider<LangNotifier>(
          create: (_) => LangNotifier(),
        ),
      ],
      child: Consumer<LangNotifier>(
        builder: (context, value, child) {
          return EasyLocalization(
            supportedLocales: value.langs,
            startLocale: value.selectedLang,
            path: 'assets/translations',
            child: const MyApp(),
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final langNotifier = Provider.of<LangNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.getTheme,
      locale: langNotifier.selectedLang,
      supportedLocales: langNotifier.langs,
      localizationsDelegates: context.localizationDelegates,
      title: AppConstants.appName,
      home:
          HomeScreen(themeNotifier: themeNotifier, langNotifier: langNotifier),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final LangNotifier langNotifier;
  const HomeScreen({
    Key? key,
    required this.themeNotifier,
    required this.langNotifier,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ! TODO:
    ChampionRepository championRepository = ChampionRepository();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              themeNotifier.setTheme(themeNotifier.getTheme);
            },
            icon: themeNotifier.getTheme == darkTheme
                ? const Icon(Icons.nightlight_round_outlined)
                : const Icon(Icons.wb_sunny_outlined),
          ),
          DropdownButton<Locale>(
            value: langNotifier.selectedLang,
            onChanged: (Locale? newLocale) {
              //context.setLocale(newLocale!);
              langNotifier.setLanguage(newLocale!);
            },
            items: const [
              DropdownMenuItem<Locale>(
                  child: Text('English'), value: Locale('en', 'US')),
              DropdownMenuItem<Locale>(
                  child: Text('Turkish'), value: Locale('tr', 'TR')),
            ],
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: championRepository.getChampions(langNotifier.selectedLang),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 300,
                      //TODO: Use ProxyProvider for injecting
                      child: FutureBuilder(
                        future: championRepository.getDetailedChampion(
                            snapshot.data[index].id, langNotifier.selectedLang),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.skins.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: AppConstants
                                            .championLoadingImageUrl +
                                        snapshot.data.id +
                                        '_${snapshot.data.skins[index].num}.jpg',
                                    height: 230,
                                    width: 140,
                                    cacheKey: snapshot.data.skins[index].id,
                                  ),
                                  Text(snapshot.data.skins[index].name),
                                  Text('chromas: ' +
                                      snapshot.data.skins[index].chromas
                                          .toString()),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
