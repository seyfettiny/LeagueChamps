import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:lolwiki/app/route_paths.dart';
import 'package:lolwiki/data/data_sources/hive_service.dart';
import 'package:lolwiki/presentation/notifiers/connectivity_notifier.dart';
import 'package:lolwiki/presentation/screens/home_screen.dart';

import '../../data/repositories/version_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initApp();
    super.initState();
  }

  Future<void> _initApp() async {
    await HiveService().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutePaths.home, (route) => false);
              },
              child: Text('Button'),
            ),
            Consumer<ConnectivityNotifier>(
                builder: (context, connectivity, child) {
              if (connectivity.connectivity != ConnectivityResult.none) {
                return Consumer<VersionRepository>(
                  builder: (context, versionRepository, child) {
                    return FutureBuilder(
                      future: Future.wait([
                        versionRepository.getVersion(),
                        versionRepository.getVersionList(),
                      ]),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data[0].toString());
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        return const CircularProgressIndicator();
                      },
                    );
                  },
                );
              } else {
                return Text('Not connected');
              }
            }),
          ],
        ),
      ),
    );
  }
}
