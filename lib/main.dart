import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '/app/route_paths.dart';
import '/app/constants.dart';
import '/ui/router.dart';
import '/ui/screens/home_screen.dart';
import '/ui/notifiers/lang_notifier.dart';
import '/ui/notifiers/theme_notifier.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.HIVE_BOX_LANG);
  await Hive.openBox(AppConstants.HIVE_BOX_THEME);
  EasyLocalization.logger.enableLevels = <LevelMessages>[
    LevelMessages.error,
    LevelMessages.info,
    LevelMessages.warning
  ];
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      //TODO: Extract providers to seperate folder
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider<LangNotifier>(create: (_) => LangNotifier()),
      ],
      child: Consumer<LangNotifier>(
        builder: (context, value, child) {
          return EasyLocalization(
            supportedLocales: value.langs,
            startLocale: value.selectedLang,
            //fallbackLocale: Locale('en', 'US'),
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
      initialRoute: RoutePaths.splash,
      onGenerateRoute: MyRouter.generateRoute,
      title: AppConstants.appName,
    );
  }
}
