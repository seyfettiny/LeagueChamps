import 'package:flutter/material.dart';

import '../../presentation/screens/champ_detail_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/privacy_policy_screen.dart';
import '../../presentation/screens/settings_screen.dart';
import '../../presentation/screens/skin_overview_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import 'route_paths.dart';

class MyRouter {
  MyRouter._init();
  static final MyRouter _instance = MyRouter._init();
  factory MyRouter() => _instance;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return fadeTransition(const SplashScreen());

      case RoutePaths.settings:
        return fadeTransition(const SettingsScreen());

      case RoutePaths.privacyPolicy:
        return fadeTransition(const PrivacyPolicyScreen());

      case RoutePaths.champDetail:
        final arg = settings.arguments as Map;
        return fadeTransition(ChampDetailScreen(champId: arg['champId'],
        champName: arg['champName'],
        champTitle: arg['champTitle'],
        ));

      case RoutePaths.skinOverview:
        final arg = settings.arguments as Map;
        return fadeTransition(
          SkinOverViewScreen(
            skinUrl: arg['skinUrl'],
            skinId: arg['skinId'],
            skinName: arg['skinName'],
          ),
        );

      case RoutePaths.home:
        return fadeTransition(HomeScreen());
      default:
        return fadeTransition(Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }

  static PageRouteBuilder fadeTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
