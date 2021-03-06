import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app/constants/app_constants.dart';
import 'app/constants/locale_constants.dart';
import 'app/notifiers/theme_notifier.dart';
import 'app/routing/route_paths.dart';
import 'app/routing/router.dart';
import 'app/themes/dark_theme.dart';
import 'app/themes/light_theme.dart';
import 'app/translations/codegen_loader.g.dart';
import 'data/data_sources/hive_service.dart';
import 'providers.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      child: EasyLocalization(
        supportedLocales: LocaleConstants.supportedLocales,
        fallbackLocale: LocaleConstants.supportedLocales[0],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    //TODO: use context.deviceLocale instead of context.locale
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.isDarkTheme ? darkTheme : lightTheme,
      locale: context.locale,
      supportedLocales: LocaleConstants.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      initialRoute: RoutePaths.splash,
      onGenerateRoute: MyRouter.generateRoute,
      title: AppConstants.appName,
    );
  }
}
