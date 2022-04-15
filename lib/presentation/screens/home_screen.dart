import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lolwiki/app/route_paths.dart';
import 'package:lolwiki/data/data_sources/hive_service.dart';
import 'package:provider/provider.dart';

import '../../app/constants.dart';
import '../../data/models/champion.dart';
import '../../data/repositories/champion_repository.dart';
import '../notifiers/lang_notifier.dart';
import 'champ_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final String version;
  const HomeScreen({
    Key? key,
    required this.version,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final langNotifier = Provider.of<LangNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.settings);
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<ChampionRepository>(
          builder: (context, championRepository, child) {
            return FutureBuilder(
              future: championRepository.getChampions(
                  version, langNotifier.selectedLang),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var box = Hive.box(AppConstants.HIVE_BOX_CHAMPIONS);
                  //TODO: remove box.clear() later
                  box.clear();
                  HiveService().saveChamps(snapshot.data);
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 300,
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
