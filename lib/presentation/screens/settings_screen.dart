import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../app/routing/route_paths.dart';
import 'package:provider/provider.dart';

import '../../app/notifiers/theme_notifier.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/translations/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    final versionNotifier = context.watch<VersionNotifier>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: const Text(LocaleKeys.settings).tr()),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            title: const Text(LocaleKeys.darkTheme).tr(),
            trailing: Switch(
              value: themeNotifier.isDarkTheme,
              activeColor: Theme.of(context).colorScheme.secondary,
              onChanged: (value) {
                themeNotifier.changeTheme();
              },
            ),
          ),
          ListTile(
            title: const Text(LocaleKeys.version).tr(),
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
            title: const Text(LocaleKeys.language).tr(),
            trailing: DropdownButton<Locale>(
              isDense: true,
              alignment: Alignment.centerRight,
              value: context.locale,
              underline: Container(),
              onChanged: (Locale? newLocale) {
                // TODO: [BUG] vn_VN Null check operator used on a null value and MaterialLocalization Not found error
                // TODO: [BUG] th_TH Null check operator used on a null value and MaterialLocalization Not found error
                // TODO: [BUG] id_ID does not work at datadragon and returns 403
                if (newLocale.toString() != LocaleKeys.vn_VN ||
                    newLocale.toString() != LocaleKeys.id_ID ||
                    newLocale.toString() != LocaleKeys.th_TH) {
                  context.setLocale(newLocale!);
                }
              },
              items: context.supportedLocales.map((Locale locale) {
                final bool isEnabled = locale != LocaleKeys.vn_VN.toLocale() &&
                    locale != LocaleKeys.id_ID.toLocale() &&
                    locale != LocaleKeys.th_TH.toLocale();
                return DropdownMenuItem<Locale>(
                  enabled: isEnabled,
                  child: SizedBox(
                    width: 180,
                    child: Text(
                      locale.toString().tr(),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: isEnabled ? null : Colors.grey,
                      ),
                    ),
                  ),
                  value: locale,
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text(
              LocaleKeys.privacyPolicy,
              overflow: TextOverflow.ellipsis,
            ).tr(),
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
              child: Text(
                'LeagueChamps isn\'t endorsed by Riot Games and doesn\'t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing Riot Games properties. Riot Games, and all associated properties are trademarks or registered trademarks of Riot Games, Inc',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.overline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
