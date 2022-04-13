import 'package:flutter/material.dart';

import '../app/route_paths.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

class MyRouter {
  static final MyRouter _instance = MyRouter._init();
  MyRouter._init();
  static MyRouter get instance => _instance;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
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
