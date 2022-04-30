import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routing/route_paths.dart';
import '../../app/utils/my_search_delegate.dart';
import '../notifiers/search_notifier.dart';
import '../notifiers/version_notifier.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/champion_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    var versionNotifier = Provider.of<VersionNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'League',
                  style: TextStyle(fontWeight: FontWeight.w800)),
              TextSpan(
                  text: 'Champs',
                  style: TextStyle(fontWeight: FontWeight.w300)),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.settings);
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<HomeViewModel>(
          builder: (context, homeViewModel, child) {
            return FutureBuilder(
              future: homeViewModel.getChampions(
                  versionNotifier.currentVersion, context.locale),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final _searchNotifier = Provider.of<SearchNotifier>(context);
                if (snapshot.hasData) {
                  _searchNotifier.addChampions(snapshot.data);
                  print('List length: ${snapshot.data.length}');
                  //TODO: add AnimatedList to make more noticeble that champ insert or delete when version changes
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var champion = snapshot.data[index];
                      return ChampionListItem(champion: champion);
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            );
          },
        ),
      ),
    );
  }
}
