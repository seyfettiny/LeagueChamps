import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../notifiers/version_notifier.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../data/repositories/champion_repository.dart';
import '../../domain/entities/champion_detailed.dart';
import '../widgets/blurred_appbar.dart';
import '../widgets/champion_spells_widget.dart';

class ChampDetailScreen extends StatelessWidget {
  final String champId;
  const ChampDetailScreen({
    Key? key,
    required this.champId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var championRepository = Provider.of<ChampionRepository>(context);
    var versionNotifier = Provider.of<VersionNotifier>(context);
    //TODO: Extract paddings/margins to constants
    return FutureBuilder(
      future: championRepository.getDetailedChampion(
          champId, versionNotifier.currentVersion, context.locale),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          ChampDetailed champ = asyncSnapshot.data as ChampDetailed;
          var champDefaultSkin =
              '${champ.skins!.where((element) => element.num == 0).first.num}';
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: BlurredAppBar(
              name: champ.name!,
              title: champ.title!,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    AppConstants.championLoadingImageUrl +
                        champ.id! +
                        '_$champDefaultSkin.jpg',
                    cacheKey: '${champ.id!}+_$champDefaultSkin.jpg' +
                        versionNotifier.currentVersion,
                  ),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 120, left: 16, right: 16),
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'version: ${versionNotifier.currentVersion.toString()}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: champ.tags!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Image(
                                  image: AssetImage(
                                    'assets/champ_classes/${champ.tags![index]}_icon.png',
                                  ),
                                  height: 36,
                                  width: 36,
                                );
                              },
                            ),
                          ),
                          Text(
                            'Attack: ${champ.info!.attack.toString()}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Defence: ${champ.info!.defense.toString()}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Magic: ${champ.info!.magic.toString()}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Difficulty: ${champ.info!.difficulty.toString()}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '\n partype: ${champ.partype}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '\n Lore: ${champ.lore}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '\n allytips: ${champ.allytips}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '\n enemytips: ${champ.enemytips}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '\n spells: \n',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: 140,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: champ.spells!.length + 1,
                                itemBuilder: (context, index) {
                                  return ChampionSpellsWidget(
                                      index: index,
                                      champ: champ,
                                      context: context);
                                }),
                          ),
                          Text(
                            '\n skins: \n',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: champ.skins!.length,
                              itemBuilder: (context, index) {
                                var champSkin = champ.skins![index];
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          RoutePaths.skinOverview,
                                          arguments: {
                                            'skin': AppConstants
                                                    .championLoadingImageUrl +
                                                champ.id! +
                                                '_${champSkin.num}.jpg',
                                            'skinId': champSkin.id
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 16),
                                        width: 140,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            //TODO: Add shimmer placeholder
                                            image: CachedNetworkImageProvider(
                                              AppConstants
                                                      .championLoadingImageUrl +
                                                  champ.id! +
                                                  '_${champSkin.num}.jpg',
                                              cacheKey: champSkin.id! +
                                                  versionNotifier
                                                      .currentVersion,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      champSkin.name! == 'default'
                                          ? ''
                                          : champSkin.name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
