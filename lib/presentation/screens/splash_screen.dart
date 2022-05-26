import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/notifiers/version_notifier.dart';
import '../../app/routing/route_paths.dart';
import '../../app/translations/locale_keys.g.dart';
import '../../app/utils/connectivity_service.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isRedirected = true;
    final _connectivityService = context.read<ConnectivityService>();
    final _versionNotifier = context.read<VersionNotifier>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Consumer<SplashViewModel>(
            builder: (context, splashViewModel, child) {
              return FutureBuilder(
                future: Future.wait([
                  splashViewModel.getVersion(),
                  splashViewModel.getVersionList(),
                ]),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!_connectivityService.hasConnection()) {
                    return const Text(LocaleKeys.noConnection).tr();
                  }
                  if (!snapshot.hasData) {
                    if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: !_isRedirected,
                            child: ElevatedButton(
                              onPressed: () {
                                _versionNotifier.setVersionList(
                                    splashViewModel.versionList);
                                _versionNotifier.changeVersion(
                                    splashViewModel.currentVersion);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, RoutePaths.home, (route) => false);
                              },
                              child: Text(MaterialLocalizations.of(context)
                                  .okButtonLabel),
                            ),
                          ),
                          Text(splashViewModel.currentVersion.toString()),
                        ],
                      );
                    }
                    return const CircularProgressIndicator();
                  }
                  Future.delayed(const Duration(seconds: 2), () {
                    _versionNotifier
                        .setVersionList(splashViewModel.versionList);
                    _versionNotifier
                        .changeVersion(splashViewModel.currentVersion);
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutePaths.home, (route) => false);
                  }).onError((error, stackTrace) {
                    _isRedirected = false;
                    return null;
                  });
                  return Container();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
