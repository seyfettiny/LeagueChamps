import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../app/constants/app_constants.dart';
import '../../app/constants/hive_constants.dart';
import 'package:provider/provider.dart';

import '../../app/routing/route_paths.dart';
import '../../data/data_sources/hive_service.dart';
import '../../domain/entities/champion.dart';
import '../notifiers/search_notifier.dart';

class SearchFinder extends StatelessWidget {
  final String query;
  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hiveProvider = Provider.of<HiveService>(context);
    var filterList = Provider.of<SearchNotifier>(context);
    return ValueListenableBuilder(
      valueListenable:
          hiveProvider.getBox(HiveConstants.HIVE_BOX_CHAMPIONS).listenable(),
      builder: (context, Box championBox, _) {
        List results;
        if (query.isEmpty && filterList.filters.isEmpty) {
          results = championBox.values.toList();
        } else {
          results = championBox.values.where((champion) {
            return champion.name!.toLowerCase().contains(query.toLowerCase());
          }).where((champion) {
            //TODO: refactor this
            return champion.tags!.contains('${filterList.filters[0]}');
          }).toList();
        }
        print('query: $query');
        print('filters: ${filterList.filters}');
        print('results: ${results.length}');
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
                          //TODO: refactor this
                          imageUrl: AppConstants.championAPIBaseUrl +
                              '12.7.1' +
                              AppConstants.championSquareImageRoute +
                              champion.image!.full!,
                          cacheKey: champion.image!.full,
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
                        Navigator.pushNamed(
                          context,
                          RoutePaths.champDetail,
                          arguments: {
                            'champId': champion.id,
                            'version': '12.7.1'
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
