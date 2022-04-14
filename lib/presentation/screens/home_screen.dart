import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants.dart';
import '../../app/themes/dark_theme.dart';
import '../../app/translations/locale_keys.g.dart';
import '../../data/repositories/champion_repository.dart';
import '../notifiers/lang_notifier.dart';
import '../notifiers/theme_notifier.dart';
import 'champ_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  String version;
  //TODO:
  HomeScreen({
    Key? key,
    required this.version,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final langNotifier = Provider.of<LangNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              themeNotifier.setTheme(themeNotifier.getTheme);
            },
            icon: themeNotifier.getTheme == darkTheme
                ? const Icon(Icons.nightlight_round_outlined)
                : const Icon(Icons.wb_sunny_outlined),
          ),
          DropdownButton<Locale>(
            value: langNotifier.selectedLang,
            onChanged: (Locale? newLocale) {
              //context.setLocale(newLocale!);
              langNotifier.setLanguage(newLocale!);
            },
            items: 
            [
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
        ],
      ),
      body: Center(
        child: Consumer<ChampionRepository>(
          builder: (context, championRepository, child) {    
            return FutureBuilder(
              future:
                  championRepository.getChampions(version,langNotifier.selectedLang),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 300,
                          //TODO: Use ProxyProvider for injecting
                          child: FutureBuilder(
                            future: championRepository.getDetailedChampion(
                                snapshot.data[index].id,
                                version,
                                langNotifier.selectedLang),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.skins.length,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            PageRouteBuilder(
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 700),
                                              pageBuilder: (BuildContext
                                                      context,
                                                  Animation<double> animation,
                                                  Animation<double>
                                                      secondaryAnimation) {
                                                return ChampDetailScreen(
                                                    skinId: snapshot
                                                        .data.skins[index].id,
                                                    champ: snapshot.data);
                                              },
                                              transitionsBuilder: (BuildContext
                                                      context,
                                                  Animation<double> animation,
                                                  Animation<double>
                                                      secondaryAnimation,
                                                  Widget child) {
                                                return Align(
                                                  child: ScaleTransition(
                                                    scale: animation,
                                                    child: child,
                                                  ),
                                                );
                                              },
                                            ),
                                            // context,
                                            // MaterialPageRoute(
                                            //   builder: (_) => ChampDetailScreen(
                                            //     champ: snapshot.data,
                                            //     skinId:
                                            //         snapshot.data.skins[index].id,
                                            //   ),
                                            // ),
                                          );
                                        },
                                        child: Hero(
                                          tag: snapshot.data.skins[index].id,
                                          child: CachedNetworkImage(
                                            imageUrl: AppConstants
                                                    .championLoadingImageUrl +
                                                snapshot.data.id +
                                                '_${snapshot.data.skins[index].num}.jpg',
                                            height: 230,
                                            width: 140,
                                            cacheKey:
                                                snapshot.data.skins[index].id,
                                          ),
                                        ),
                                      ),
                                      Text(snapshot.data.skins[index].name),
                                      Text('chromas: ' +
                                          snapshot.data.skins[index].chromas
                                              .toString()),
                                    ],
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
