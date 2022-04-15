import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/app/themes/dark_theme.dart';
import 'package:leaguechamps/app/themes/light_theme.dart';
import 'package:provider/provider.dart';

import '../../app/translations/locale_keys.g.dart';
import '../notifiers/lang_notifier.dart';
import '../notifiers/theme_notifier.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final langNotifier = Provider.of<LangNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: DropdownButton(
              isExpanded: true,
              value: themeNotifier.getTheme,
              items: [
                DropdownMenuItem<ThemeData>(
                  child: const Text('Light Theme'),
                  value: lightTheme,
                ),
                DropdownMenuItem<ThemeData>(
                  child: const Text('Dark Theme'),
                  value: darkTheme,
                ),
              ],
              onChanged: (ThemeData? value) {
                themeNotifier.setTheme(value!);
              },
            ),
          ),
          ListTile(title: Text(LocaleKeys.hello.tr())),
          ListTile(
            title: DropdownButton<Locale>(
              isExpanded: true,
              value: langNotifier.selectedLang,
              onChanged: (Locale? newLocale) {
                context.setLocale(newLocale!);
                langNotifier.setLanguage(newLocale);
              },
              items: [
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.en_US.tr()),
                    value: LocaleKeys.en_US.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.cs_CZ.tr()),
                    value: LocaleKeys.cs_CZ.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.de_DE.tr()),
                    value: LocaleKeys.de_DE.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.el_GR.tr()),
                    value: LocaleKeys.el_GR.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.en_AU.tr()),
                    value: LocaleKeys.en_AU.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.en_GB.tr()),
                    value: LocaleKeys.en_GB.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.en_PH.tr()),
                    value: LocaleKeys.en_PH.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.en_SG.tr()),
                    value: LocaleKeys.en_SG.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.es_AR.tr()),
                    value: LocaleKeys.es_AR.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.es_ES.tr()),
                    value: LocaleKeys.es_ES.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.es_MX.tr()),
                    value: LocaleKeys.es_MX.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.fr_FR.tr()),
                    value: LocaleKeys.fr_FR.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.hu_HU.tr()),
                    value: LocaleKeys.hu_HU.toLocale()),
                //TODO: [BUG] lang code for Indonesian does not work at datadragon and returns 403
                // DropdownMenuItem<Locale>(
                //     child: Text(LocaleKeys.id_ID.tr()),
                //     value: LocaleKeys.id_ID.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.it_IT.tr()),
                    value: LocaleKeys.it_IT.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.ja_JP.tr()),
                    value: LocaleKeys.ja_JP.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.ko_KR.tr()),
                    value: LocaleKeys.ko_KR.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.pl_PL.tr()),
                    value: LocaleKeys.pl_PL.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.pt_BR.tr()),
                    value: LocaleKeys.pt_BR.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.ro_RO.tr()),
                    value: LocaleKeys.ro_RO.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.ru_RU.tr()),
                    value: LocaleKeys.ru_RU.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.th_TH.tr()),
                    value: LocaleKeys.th_TH.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.tr_TR.tr()),
                    value: LocaleKeys.tr_TR.toLocale()),

                // TODO: [BUG] Null check operator used on a null value and MaterialLocalization Not found error
                // DropdownMenuItem<Locale>(
                //     child: Text(LocaleKeys.vn_VN.tr()),
                //     value: LocaleKeys.vn_VN.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.zh_CN.tr()),
                    value: LocaleKeys.zh_CN.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.zh_MY.tr()),
                    value: LocaleKeys.zh_MY.toLocale()),
                DropdownMenuItem<Locale>(
                    child: Text(LocaleKeys.zh_TW.tr()),
                    value: LocaleKeys.zh_TW.toLocale()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
