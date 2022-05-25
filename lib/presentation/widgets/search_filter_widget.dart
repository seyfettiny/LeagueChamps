import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/enums/champ_class.dart';
import '../../app/notifiers/search_notifier.dart';
import '../../app/translations/locale_keys.g.dart';

class SearchFilterWidget extends StatefulWidget {
  const SearchFilterWidget({Key? key}) : super(key: key);

  @override
  State<SearchFilterWidget> createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  Iterable<Widget> get _filterWidgets {
    var filterList = Provider.of<SearchNotifier>(context);
    return ChampClass.values.map((ChampClass tag) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: FilterChip(
          label: Text('${LocaleKeys.champClasses}.${tag.name}'.tr()),
          elevation: 2,
          selectedColor: Theme.of(context).chipTheme.selectedColor,
          selected: filterList.filters.contains(tag.name.toString()),
          showCheckmark: false,
          avatar: Image(
            image: AssetImage(
              'assets/champ_classes/${tag.name.toString()}_icon.png',
            ),
          ),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                filterList.addFilter(tag.name.toString());
              } else {
                filterList.removeFilterWhere(
                    (String element) => element == tag.name.toString());
              }
            });
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('${LocaleKeys.filterBy.tr()} '),
            ..._filterWidgets,
          ],
        ),
      ),
    );
  }
}
