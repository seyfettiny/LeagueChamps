import 'package:flutter/material.dart';
import 'package:leaguechamps/app/enums/champ_class.dart';

class SearchFilterWidget extends StatefulWidget {
  final List<String> filters = [];
  SearchFilterWidget({Key? key}) : super(key: key);

  @override
  State<SearchFilterWidget> createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  Iterable<Widget> get _filterWidgets =>
      ChampClass.values.map((ChampClass tag) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: FilterChip(
            label: Text(tag.name.toString()),
            elevation: 2,
            selectedColor: Theme.of(context).chipTheme.selectedColor,
            selected: widget.filters.contains(tag.name.toString()),
            showCheckmark: false,
            avatar: Image(
              image: AssetImage(
                'assets/champ_classes/${tag.name.toString()}_icon.png',
              ),
            ),
            onSelected: (bool value) {
              setState(() {
                if (value) {
                  widget.filters.add(tag.name.toString());
                } else {
                  widget.filters.removeWhere(
                      (String element) => element == tag.name.toString());
                }
              });
            },
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text('Filter by: '),
            ..._filterWidgets,
          ],
        ),
      ),
    );
  }
}
