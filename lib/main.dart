import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lolwiki/app/constants.dart';
import 'package:lolwiki/app/enum_champ_class.dart';
import 'package:lolwiki/domain/repository/champion_repository/champion_repository.dart';
import 'package:lolwiki/ui/notifiers/theme_notifier.dart';
import 'package:lolwiki/ui/themes/dark_theme.dart';
import 'package:lolwiki/ui/themes/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'generated/locale_keys.g.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      //TODO: Extract providers to seperate folder
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(lightTheme),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [const Locale('en', 'US'), const Locale('tr', 'TR')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        startLocale: const Locale('tr', 'TR'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.getTheme,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: AppConstants.appName,
      home: HomeScreen(themeNotifier: themeNotifier),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  const HomeScreen({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ! TODO:
    ChampionRepository championRepository = ChampionRepository();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                widget.themeNotifier.setTheme(widget.themeNotifier.getTheme);
              },
              icon: widget.themeNotifier.getTheme == darkTheme
                  ? const Icon(Icons.nightlight_round_outlined)
                  : const Icon(Icons.wb_sunny_outlined))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: championRepository.getChampions(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 300,
                      //TODO: Use ProxyProvider for injecting
                      child: FutureBuilder(
                        future: championRepository
                            .getDetailedChampion(snapshot.data[index].id),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.skins.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Image.network(
                                    AppConstants.championLoadingImageUrl +
                                        snapshot.data.id +
                                        '_${snapshot.data.skins[index].num}.jpg',
                                    height: 230,
                                    width: 140,
                                  ),
                                  Text(snapshot.data.skins[index].name),
                                  Text('chromas: ' +
                                      snapshot.data.skins[index].chromas
                                          .toString()),
                                ],
                              ),
                            );
                          } else {
                            return const Center(child: CircularProgressIndicator());
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
