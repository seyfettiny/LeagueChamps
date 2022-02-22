import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lolwiki/ui/notifiers/theme_notifier.dart';
import 'package:lolwiki/ui/themes/dark_theme.dart';
import 'package:lolwiki/ui/themes/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'generated/locale_keys.g.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await dotenv.load(fileName: ".env");
  //await Hive.initFlutter();
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
      title: 'title'.tr(),
      home: HomeScreen(themeNotifier: themeNotifier),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  const HomeScreen({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                themeNotifier.setTheme(themeNotifier.getTheme);
              },
              icon: themeNotifier.getTheme == darkTheme
                  ? const Icon(Icons.nightlight_round_outlined)
                  : const Icon(Icons.wb_sunny_outlined))
        ],
      ),
      body: Center(
        child: Text(LocaleKeys.hello.tr()),
      ),
    );
  }
}
