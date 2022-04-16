import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:leaguechamps/data/data_sources/hive_service.dart';
import 'package:provider/provider.dart';

import 'app/themes/dark_theme.dart';
import 'app/themes/light_theme.dart';
import 'providers.dart';
import 'app/constants.dart';
import 'app/routing/router.dart';
import 'presentation/notifiers/lang_notifier.dart';
import 'presentation/notifiers/theme_notifier.dart';

import 'app/routing/route_paths.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await HiveService().init();
  EasyLocalization.logger.enableLevels = <LevelMessages>[
    LevelMessages.error,
    LevelMessages.info,
    LevelMessages.warning
  ];
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: providers,
      child: Consumer<LangNotifier>(
        builder: (context, value, _) {
          return EasyLocalization(
            supportedLocales: value.langs,
            startLocale: value.selectedLang,
            fallbackLocale: const Locale('en', 'US'),
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
      theme: themeNotifier.isDarkTheme ? darkTheme : lightTheme,
      locale: langNotifier.selectedLang,
      supportedLocales: langNotifier.langs,
      localizationsDelegates: context.localizationDelegates,
      initialRoute: RoutePaths.splash,
      onGenerateRoute: MyRouter.generateRoute,
      title: AppConstants.appName,
    );
  }
}
