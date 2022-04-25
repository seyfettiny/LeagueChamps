import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/domain/entities/champion.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../app/utils/my_search_delegate.dart';
import '../../data/data_sources/hive_service.dart';
import '../../data/repositories/champion_repository.dart';

class HomeScreen extends StatelessWidget {
  final String version;
  const HomeScreen({
    Key? key,
    required this.version,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var hiveProvider = Provider.of<HiveService>(context);
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
            icon: const Icon(Icons.search),
          ),
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
                  List<Champion> champions = snapshot.data;
                  //TODO: move this to the VM
                  // hiveProvider
                  //     .clearBox(HiveConstants.HIVE_BOX_CHAMPIONS)
                  //     .then((value) => null);
                  hiveProvider.saveChamps(snapshot.data).then((value) => null);
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutePaths.champDetail,
                              arguments: {
                                'champId': champions[index].id,
                                'version': version,
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox.square(
                                dimension: 120,
                                child: CachedNetworkImage(
                                  imageUrl: AppConstants.championAPIBaseUrl +
                                      version +
                                      AppConstants.championSquareImageRoute +
                                      champions[index].image!.full!,
                                  cacheKey: champions[index].image!.full,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          champions[index].name! + ', ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Flexible(
                                          child: Text(
                                            champions[index].title!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      champions[index].tags!.join(', '),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      champions[index].blurb!.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
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
