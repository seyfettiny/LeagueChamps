import 'package:flutter/material.dart';
import 'package:lolwiki/app/route_paths.dart';
import 'package:lolwiki/domain/repository/version_repository.dart';
import 'package:lolwiki/data/data_sources/hive_service.dart';
import 'package:lolwiki/presentation/router.dart';

import '../../data/repositories/version_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final VersionRepository versionRepository = VersionRepository();
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
            FutureBuilder(
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
            ),
          ],
        ),
      ),
    );
  }
}
