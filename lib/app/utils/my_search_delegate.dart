import 'package:flutter/material.dart';
import 'package:leaguechamps/presentation/widgets/search_widget.dart';

class MySearchDelegate extends SearchDelegate {
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Filter by: '),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: const Chip(
                    avatar: Image(
                      image: AssetImage(
                        'assets/champ_classes/Assassin_icon.png',
                      ),
                    ),
                    elevation: 5,
                    label: Text('Assassin'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: const Chip(
                    avatar: Image(
                      image: AssetImage(
                        'assets/champ_classes/Fighter_icon.png',
                      ),
                    ),
                    elevation: 5,
                    label: Text('Fighter'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: const Chip(
                    avatar: Image(
                      image: AssetImage(
                        'assets/champ_classes/Mage_icon.png',
                      ),
                    ),
                    elevation: 5,
                    label: Text('Mage'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: const Chip(
                    avatar: Image(
                      image: AssetImage(
                        'assets/champ_classes/Marksman_icon.png',
                      ),
                    ),
                    elevation: 5,
                    label: Text('Marksman'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: const Chip(
                    avatar: Image(
                      image: AssetImage(
                        'assets/champ_classes/Support_icon.png',
                      ),
                    ),
                    elevation: 5,
                    label: Text('Support'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: const Chip(
                    avatar: Image(
                      image: AssetImage(
                        'assets/champ_classes/Tank_icon.png',
                      ),
                    ),
                    elevation: 5,
                    label: Text('Tank'),
                  ),
                ),
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchFinder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFinder(query: query);
  }
}
