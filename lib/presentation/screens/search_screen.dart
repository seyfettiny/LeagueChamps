import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/champion.dart';
import '../notifiers/search_notifier.dart';
import '../widgets/champion_search_item.dart';

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
