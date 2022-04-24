import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaguechamps/app/constants/app_constants.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import 'package:leaguechamps/data/models/champion_model.dart';
import 'package:provider/provider.dart';

import '../../app/routing/route_paths.dart';
import '../../data/data_sources/hive_service.dart';

class SearchFinder extends StatelessWidget {
  final Map<String, dynamic> query;
  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hiveProvider = Provider.of<HiveService>(context);
    return ValueListenableBuilder(
      valueListenable:
          hiveProvider.getBox(HiveConstants.HIVE_BOX_CHAMPIONS).listenable(),
      builder: (context, Box championBox, _) {
        print(query['name']?.toLowerCase());
        var results = query.isEmpty
            ? championBox.values.toList()
            : championBox.values.where((champion) {
                return champion.name
                    .toLowerCase()
                    .contains(query['name']?.toLowerCase());
              }).toList();
        return results.isEmpty
            ? const Center(child: Text('No results found'))
            : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  ChampionModel champion = results[index];
                  var heroTag = hiveProvider
                      .getDetailedChamp(champion.id!)
                      .skins!
                      .where((element) => element.num == 0)
                      .first
                      .id
                      .toString();
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Hero(
                        tag: heroTag,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          //TODO: BUG Fiddlesticks does not work
                          child: CachedNetworkImage(
                            imageUrl: AppConstants.championTileImageUrl +
                                champion.id.toString() +
                                '_0.jpg',
                            cacheKey: AppConstants.championTileImageUrl +
                                champion.id.toString() +
                                '_0.jpg',
                            errorWidget: (context, url, error) =>
                                const SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.redAccent,
                              ),
                            ),
                            placeholder: (context, url) => const SizedBox(
                              width: 56,
                              height: 56,
                              child: SizedBox.square(
                                  dimension: 25,
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      ),
                      title: Text(champion.name!),
                      onTap: () {
                        var champDetailed =
                            hiveProvider.getDetailedChamp(champion.id!);
                        Navigator.of(context).pushNamed(
                          RoutePaths.champDetail,
                          arguments: {
                            'champ': champDetailed,
                            'skinId': champDetailed.skins!
                                .where((element) => element.num == 0)
                                .first
                                .id,
                          },
                        );
                      },
                    ),
                  );
                },
              );
      },
    );
  }
}
