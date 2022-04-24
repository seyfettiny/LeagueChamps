import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaguechamps/app/constants/app_constants.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import 'package:leaguechamps/data/models/champion_model.dart';
import 'package:provider/provider.dart';

import '../../app/routing/route_paths.dart';
import '../../data/data_sources/hive_service.dart';

class SearchFinder extends StatelessWidget {
  final String query;
  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hiveProvider = Provider.of<HiveService>(context);
    return ValueListenableBuilder(
      valueListenable:
          hiveProvider.getBox(HiveConstants.HIVE_BOX_CHAMPIONS).listenable(),
      builder: (context, Box championBox, _) {
        var results = query.isEmpty
            ? championBox.values.toList()
            : championBox.values.where((champion) {
                return champion.name
                    .toLowerCase()
                    .contains(query.toLowerCase());
              }).toList();
        return results.isEmpty
            ? const Center(child: Text('No results found'))
            : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  ChampionModel champion = results[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Hero(
                        tag: champion.id! + '_0',
                        child: CachedNetworkImage(
                          imageUrl: AppConstants.championTileImageUrl +
                              champion.id.toString() +
                              '_0.jpg',
                          cacheKey: AppConstants.championTileImageUrl +
                              champion.id.toString() +
                              '_0.jpg',
                          errorWidget: (context, url, error) => const SizedBox(
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
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      title: Text(champion.name!),
                      onTap: () {
                        var champDetailed = hiveProvider
                            .getBox(HiveConstants.HIVE_BOX_CHAMPDETAILED)
                            .get(champion.id!.toString());
                        Navigator.pushNamed(context, RoutePaths.champDetail,
                            arguments: {
                              'champ': champDetailed,
                              'skinId': champion.id! + '_0',
                            });
                      },
                    ),
                  );
                },
              );
      },
    );
  }
}
