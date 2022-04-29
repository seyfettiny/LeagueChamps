import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/constants/hive_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../data/data_sources/hive_service.dart';
import '../../domain/entities/champion.dart';
import '../notifiers/search_notifier.dart';
import '../notifiers/version_notifier.dart';

class SearchFinder extends StatelessWidget {
  final String query;
  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hiveProvider = Provider.of<HiveService>(context);
    var filterProvider = Provider.of<SearchNotifier>(context);
    var versionNotifier = Provider.of<VersionNotifier>(context);
    return ValueListenableBuilder(
      valueListenable: hiveProvider
          .getBox(
            HiveConstants.HIVE_BOX_CHAMPIONS +
                versionNotifier.currentVersion +
                context.locale.toString(),
          )
          .listenable(),
      builder: (context, Box championBox, _) {
        List results;
        if (query.isEmpty && filterProvider.filters.length == 0) {
          results = championBox.values.toList();
        } else {
          results = championBox.values.where((champion) {
            return champion.name!.toLowerCase().contains(query.toLowerCase());
          }).toList();

          //TODO: refactor this
          results.retainWhere((champion) => champion.tags!
              .join(' ')
              .contains(filterProvider.filters.join(' ')));
        }
        return results.isEmpty
            ? const Center(child: Text('No results found'))
            : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  Champion champion = results[index];
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
                              ? champion.image!.full! +
                                  versionNotifier.currentVersion
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
                },
              );
      },
    );
  }
}
