import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/app/routing/route_paths.dart';
import 'package:provider/provider.dart';

import '../../app/notifiers/theme_notifier.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/translations/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final versionNotifier = Provider.of<VersionNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //TODO: this could be a switch
          ListTile(
            title: const Text('Dark Theme'),
            trailing: Switch(
              value: themeNotifier.isDarkTheme,
              activeColor: const Color(0xFFECB857),
              onChanged: (value) {
                themeNotifier.changeTheme();
              },
            ),
          ),
          ListTile(
            title: const Text('Version'),
            trailing: DropdownButton<String>(
              underline: Container(),
              isDense: true,
              onChanged: (version) {
                versionNotifier.changeVersion(version!);
              },
              alignment: Alignment.centerRight,
              value: versionNotifier.currentVersion,
              items: versionNotifier.getVersionList().map((version) {
                return DropdownMenuItem<String>(
                  child: Text(version.toString()),
                  value: version.toString(),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<Locale>(
              isDense: true,
              alignment: Alignment.centerRight,
              value: context.locale,
              underline: Container(),
              onChanged: (Locale? newLocale) {
                // TODO: [BUG] VN_vn Null check operator used on a null value and MaterialLocalization Not found error
                // TODO: [BUG] id_ID does not work at datadragon and returns 403
                if (newLocale.toString() != LocaleKeys.vn_VN ||
                    newLocale.toString() != LocaleKeys.id_ID) {
                  context.setLocale(newLocale!);
                }
              },
              items: context.supportedLocales.map((Locale locale) {
                return DropdownMenuItem<Locale>(
                  child: Text(locale.toString().tr()),
                  value: locale,
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            trailing: const Icon(
              Icons.arrow_right,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(RoutePaths.privacyPolicy);
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.bottomCenter,
              child: const Text(
                'LeagueChamps isn\'t endorsed by Riot Games and doesn\'t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing Riot Games properties. Riot Games, and all associated properties are trademarks or registered trademarks of Riot Games, Inc',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
