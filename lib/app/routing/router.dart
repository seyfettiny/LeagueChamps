import 'package:flutter/material.dart';

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
      case RoutePaths.home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            version: settings.arguments.toString(),
          ),
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
