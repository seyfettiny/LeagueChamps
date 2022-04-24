import 'package:flutter/material.dart';
import 'package:leaguechamps/presentation/widgets/search_filter_widget.dart';
import 'package:leaguechamps/presentation/widgets/search_widget.dart';

class MySearchDelegate extends SearchDelegate {
  final _query = {
    'name': '',
    'tags': [],
  };
  MySearchDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: SearchFilterWidget(),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, {});
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchFinder(query: _query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFinder(query: _query);
  }
}
