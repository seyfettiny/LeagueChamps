import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../presentation/screens/skin_overview_screen.dart';

import '../../presentation/screens/champ_detail_screen.dart';
import '../../presentation/screens/settings_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import 'route_paths.dart';

class MyRouter {
  MyRouter._init();
  static final MyRouter _instance = MyRouter._init();
  factory MyRouter() => _instance;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutePaths.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case RoutePaths.champDetail:
        final arg = settings.arguments as Map;
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return ChampDetailScreen(
              champId: arg['champId'],
            );
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );

      case RoutePaths.skinOverview:
        final arg = settings.arguments as Map;
        return CupertinoPageRoute(
          builder: (_) => SkinOverViewScreen(
            skin: arg['skin'],
            skinId: arg['skinId'],
          ),
        );

      case RoutePaths.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
