import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../notifiers/version_notifier.dart';
import '../../app/utils/connectivity_service.dart';
import 'package:provider/provider.dart';

import '../../app/routing/route_paths.dart';
import '../viewmodels/splash_viewmodel.dart';

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
    final _connectivityService = Provider.of<ConnectivityService>(context);
    final _versionNotifier = Provider.of<VersionNotifier>(context);
    return Scaffold(
      body: Center(
        child: Consumer<SplashViewModel>(
          builder: (context, splashViewModel, child) {
            return FutureBuilder(
              future: Future.wait([
                splashViewModel.getVersion(),
                splashViewModel.getVersionList(),
              ]),
              builder: (context, AsyncSnapshot snapshot) {
                if (_connectivityService.hasConnection()) {
                  if (snapshot.hasData) {
                    Future.delayed(const Duration(seconds: 1), () {
                      _versionNotifier.changeVersion(snapshot.data[0]);
                      _versionNotifier.setVersionList(snapshot.data[1]);
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutePaths.home, (route) => false);
                    });

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _versionNotifier.setVersionList(snapshot.data[1]);
                            _versionNotifier.changeVersion(snapshot.data[0]);
                            Navigator.pushNamedAndRemoveUntil(
                                context, RoutePaths.home, (route) => false);
                          },
                          child: const Text('Button'),
                        ),
                        Text(snapshot.data[0].toString()),
                        Text(context.locale.toString().tr()),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }
                return const Text('No connection');
              },
            );
          },
        ),
      ),
    );
  }
}
