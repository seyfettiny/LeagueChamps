import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../viewmodels/home_viewmodel.dart';
import '../notifiers/version_notifier.dart';
import '../../domain/entities/champion.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../app/utils/my_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                if (snapshot.hasData) {
                  List<Champion> champions = snapshot.data;
                  //TODO: add AnimatedList to make more noticeble that champ insert or delete when version changes
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(champions[index].id);
                          Navigator.pushNamed(context, RoutePaths.champDetail,
                              arguments: {'champId': champions[index].id});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox.square(
                                dimension: 120,
                                child: CachedNetworkImage(
                                  imageUrl: champions[index].image!.full != null
                                      ? AppConstants.championAPIBaseUrl +
                                          versionNotifier.currentVersion +
                                          AppConstants.championImageRoute +
                                          champions[index].image!.full!
                                      : '',
                                  cacheKey: champions[index].image!.full != null
                                      ? champions[index].image!.full! +
                                          versionNotifier.currentVersion
                                      : '',
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          champions[index].name! + ', ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Flexible(
                                          child: Text(
                                            champions[index].title!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      champions[index].tags!.join(', '),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      champions[index].blurb!.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
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
