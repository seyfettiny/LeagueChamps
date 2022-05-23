import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:leaguechamps/domain/entities/champion.dart';
import 'package:provider/provider.dart';

import '../../app/notifiers/search_notifier.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/routing/route_paths.dart';
import '../../app/utils/my_search_delegate.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/champion_list_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Shader? linearGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: <Color>[Color(0xff7c5e28), Color(0xffcabd8f)],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 100.0, 50.0),
  );
  @override
  Widget build(BuildContext context) {
    List<Champion> champions = [];
    var versionNotifier = Provider.of<VersionNotifier>(context);
    final _searchNotifier = Provider.of<SearchNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => linearGradient!,
          child: const Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'League',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(
                    text: 'Champs',
                    style: TextStyle(fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _searchNotifier.addChampions(champions);
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
                if (snapshot.hasData) {
                  champions = snapshot.data;
                  return AnimationLimiter(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        var champion = snapshot.data[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 600),
                          child: SlideAnimation(
                            curve: Curves.easeOutExpo,
                            horizontalOffset: 100,
                            child: FadeInAnimation(
                              child: ChampionListItem(
                                champion: champion,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
