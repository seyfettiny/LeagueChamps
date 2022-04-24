import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routing/route_paths.dart';
import '../../data/data_sources/hive_service.dart';
import '../../data/repositories/version_repository.dart';
import '../notifiers/connectivity_notifier.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<ConnectivityNotifier>(
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, RoutePaths.home, (route) => false,
                                  arguments: snapshot.data[0]);
                            },
                            child: const Text('Button'),
                          ),
                          Text(snapshot.data[0].toString()),
                          Text(context.locale.toString().tr()),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                );
              },
            );
          } else {
            return const Text('Not connected');
          }
        }),
      ),
    );
  }
}
