import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lolwiki/app/constants.dart';
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
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        startLocale: Locale('tr', 'TR'),
        child: MyApp(),
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
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                var result = await championRepository.getChampions();
                for (var item in result) {
                  print(item.name);
                }
              },
              child: Text('get data'),
            ),
            TextButton(
              onPressed: () async {
                var result =
                    await championRepository.getDetailedChampion('Aatrox');
                print(result.name);
              },
              child: Text('get data'),
            ),
            Container(
              height: 400,
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: championRepository.getDetailedChampion('Aatrox'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.skins.length,
                          itemBuilder: (context, index) => Container(
                            height: 240,
                            child: Column(
                              children: [
                                Image.network(
                                  AppConstants.championLoadingImageUrl +
                                      snapshot.data.id +
                                      '_${snapshot.data.skins[index].num}.jpg',
                                  height: 200,
                                  width: 80,
                                ),
                                Text(snapshot.data.skins[index].name),
                                Text('chromas: ' +
                                    snapshot.data.skins[index].chromas
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            Text(LocaleKeys.hello.tr()),
          ],
        ),
      ),
    );
  }
}
