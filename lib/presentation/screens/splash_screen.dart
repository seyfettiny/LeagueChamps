import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/domain/use_cases/get_version_usecase.dart';
import 'package:provider/provider.dart';

import '../../app/routing/route_paths.dart';
import '../../data/repositories/version_repository.dart';
import '../notifiers/connectivity_notifier.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //TODO: precache images for homescreen
  //    precacheImage(CachedNetworkImageProvider('url'), context);
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
          return Consumer<VersionRepository>(
            builder: (context, versionRepository, child) {
              return FutureBuilder(
                future: Future.wait([
                  versionRepository.getVersion(),
                  versionRepository.getVersionList(),
                ]),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data[0] == ''
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'No internet connection, please connect at least once to the internet',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      RoutePaths.home, (route) => false);
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
        }),
      ),
    );
  }
}
