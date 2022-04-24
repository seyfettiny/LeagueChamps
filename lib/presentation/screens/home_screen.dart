import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../app/utils/my_search_delegate.dart';
import '../../data/data_sources/hive_service.dart';
import '../../data/repositories/champion_repository.dart';
import '../widgets/search_widget.dart';
import 'champ_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final String version;
  const HomeScreen({
    Key? key,
    required this.version,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'League',
                  style: TextStyle(fontWeight: FontWeight.w800)),
              TextSpan(
                  text: 'Champs',
                  style: TextStyle(fontWeight: FontWeight.w300)),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(Icons.search)),
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
              future: championRepository.getChampions(version, context.locale),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var box = Hive.box(HiveConstants.HIVE_BOX_CHAMPIONS);
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
                                context.locale),
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
                                          Navigator.of(context).pushNamed(
                                              RoutePaths.champDetail,
                                              arguments: {
                                                'champ': snapshot.data,
                                                'skinId': snapshot
                                                    .data.skins[index].id
                                              });
                                        },
                                        child: Hero(
                                          tag: snapshot.data.skins[index].id,
                                          child: SizedBox(
                                            height: 230,
                                            width: 140,
                                            child: CachedNetworkImage(
                                              imageUrl: AppConstants
                                                      .championLoadingImageUrl +
                                                  snapshot.data.id +
                                                  '_${snapshot.data.skins[index].num}.jpg',
                                              cacheKey:
                                                  snapshot.data.skins[index].id,
                                            ),
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
