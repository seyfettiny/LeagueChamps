import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/presentation/widgets/title_widget.dart';
import 'package:provider/provider.dart';

import '../../app/enums/connection_status.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/routing/route_paths.dart';
import '../../app/translations/locale_keys.g.dart';
import '../../app/utils/connectivity_service.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isRedirected = false;
    final _connectivityService = context.watch<ConnectionStatus>();
    final _versionNotifier = context.read<VersionNotifier>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Consumer<SplashViewModel>(
              builder: (context, splashViewModel, child) {
                if (_connectivityService == ConnectionStatus.offline) {
                  return const Text(LocaleKeys.noConnection).tr();
                }
                return FutureBuilder(
                  future: Future.wait([
                    splashViewModel.getVersion(),
                    splashViewModel.getVersionList(),
                  ]),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          //TODO: fix retry button.

                          // Visibility(
                          //   visible: !_isRedirected,
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //         backgroundColor: Theme.of(context)
                          //             .colorScheme
                          //             .secondary),
                          //     onPressed: () {
                          //       _versionNotifier.setVersionList(
                          //           splashViewModel.versionList);
                          //       _versionNotifier.changeVersion(
                          //           splashViewModel.currentVersion);
                          //       Navigator.pushNamedAndRemoveUntil(context,
                          //           RoutePaths.home, (route) => false);
                          //     },
                          //     child: Text(
                          //       MaterialLocalizations.of(context)
                          //           .okButtonLabel,
                          //     ),
                          //   ),
                          // ),
                        ],
                      );
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TitleWidget(textScaleFactor: 2.5),
                        Text(splashViewModel.currentVersion.toString()),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
