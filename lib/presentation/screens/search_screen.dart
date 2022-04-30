import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../domain/entities/champion.dart';
import '../notifiers/search_notifier.dart';
import '../notifiers/version_notifier.dart';

class SearchFinder extends StatelessWidget {
  final String query;
  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Champion>> championsList =
        ValueNotifier(Provider.of<SearchNotifier>(context).champions);
    var filterProvider = Provider.of<SearchNotifier>(context);
    return ValueListenableBuilder(
      valueListenable: championsList,
      builder: (context, List<Champion> champions, _) {
        List results;
        if (query.isEmpty && filterProvider.filters.length == 0) {
          results = champions;
        } else {
          results = champions.where(
            (champion) {
              return champion.name!.toLowerCase().contains(query.toLowerCase());
            },
          ).toList();

          //TODO: refactor this
          results.retainWhere(
            (champion) => champion.tags!
                .join(' ')
                .contains(filterProvider.filters.join(' ')),
          );
        }
        return results.isEmpty
            ? const Center(child: Text('No results found'))
            : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  Champion champion = results[index];
                  return ChampionSearchItem(champion: champion);
                },
              );
      },
    );
  }
}

class ChampionSearchItem extends StatelessWidget {
  const ChampionSearchItem({
    Key? key,
    required this.champion,
  }) : super(key: key);

  final Champion champion;

  @override
  Widget build(BuildContext context) {
    var versionNotifier = Provider.of<VersionNotifier>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            //TODO:  BUG champ image returns null
            imageUrl: champion.image!.full != null
                ? AppConstants.championAPIBaseUrl +
                    versionNotifier.currentVersion +
                    AppConstants.championImageRoute +
                    champion.image!.full!
                : '',
            cacheKey: champion.image!.full != null
                ? champion.image!.full! + versionNotifier.currentVersion
                : '',
            errorWidget: (context, url, error) {
              print(champion.image!.full);

              return const SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              width: 56,
              height: 56,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        title: Text(champion.name!),
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.champDetail,
            arguments: {'champId': champion.id},
          );
        },
      ),
    );
  }
}
