import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/notifiers/search_notifier.dart';
import '../../app/translations/locale_keys.g.dart';
import '../../domain/entities/champion.dart';
import '../widgets/champion_search_item.dart';

class SearchFinder extends StatelessWidget {
  final String query;
  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filterProvider = context.watch<SearchNotifier>();
    return ValueListenableBuilder(
      valueListenable:
          ValueNotifier(filterProvider.champions),
      builder: (context, List<Champion> champions, _) {
        //TODO: move this to the ViewModel
        List results;
        if (query.isEmpty && filterProvider.filters.length == 0) {
          results = champions;
        } else {
          results = champions.where(
            (champion) {
              return champion.name!.toLowerCase().contains(query.toLowerCase());
            },
          ).toList();

          results.retainWhere(
            (champion) => champion.tags!
                .toSet()
                .containsAll(
                  filterProvider.filters.toSet(),
                ),
          );
        }
        return results.isEmpty
            ? Center(child: const Text(LocaleKeys.noResultsFound).tr())
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
