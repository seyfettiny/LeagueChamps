import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RoutePaths.home, (route) => false);
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
        ),
      ),
    );
  }
}
