import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../data/data_sources/hive_service.dart';
import '../../data/repositories/champion_repository.dart';
import '../../domain/entities/champion_detailed.dart';
import '../widgets/blurred_appbar.dart';

class ChampDetailScreen extends StatelessWidget {
  final String champId;
  //final String skinId;
  final String version;
  const ChampDetailScreen({
    Key? key,
    required this.champId,
    //required this.skinId,
    required this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //precacheImage(CachedNetworkImageProvider(skinId), context);
    var championRepository = Provider.of<ChampionRepository>(context);
    var hiveProvider = Provider.of<HiveService>(context);

    //TODO: Extract paddings/margins to constants
    return FutureBuilder(
      future: championRepository.getDetailedChampion(
          champId, version, context.locale),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          ChampDetailed champ = asyncSnapshot.data as ChampDetailed;

          //TODO: move this to the VM

          // hiveProvider
          //     .clearBox(
          //         HiveConstants.HIVE_BOX_CHAMPDETAILED)
          //     .then((value) => null);
          hiveProvider.saveDetailedChamp(champ).then((value) => null);
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
                    cacheKey: '${champ.id!}+_$champDefaultSkin.jpg',
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
                            'spells: \n',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Passive: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: AppConstants
                                              .championAPIBaseUrl +
                                          '/$version/img/passive/${champ.passive!.image!.full}',
                                      cacheKey: champ.passive!.image!.full,
                                    ),
                                    Text(
                                      champ.passive!.name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Q: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: AppConstants
                                              .championAPIBaseUrl +
                                          '/$version/img/spell/${champ.spells![0].image!.full}',
                                      cacheKey: champ.spells![0].image!.full,
                                    ),
                                    Text(
                                      champ.spells![0].name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'W: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: AppConstants
                                              .championAPIBaseUrl +
                                          '/$version/img/spell/${champ.spells![1].image!.full}',
                                      cacheKey: champ.spells![1].image!.full,
                                    ),
                                    Text(
                                      champ.spells![1].name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'E: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: AppConstants
                                              .championAPIBaseUrl +
                                          '/$version/img/spell/${champ.spells![2].image!.full}',
                                      cacheKey: champ.spells![2].image!.full,
                                    ),
                                    Text(
                                      champ.spells![2].name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'R: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: AppConstants
                                              .championAPIBaseUrl +
                                          '/$version/img/spell/${champ.spells![3].image!.full}',
                                      cacheKey: champ.spells![3].image!.full,
                                    ),
                                    Text(
                                      champ.spells![3].name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: champ.skins!.length,
                              itemBuilder: (context, index) {
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
                                                '_${champ.skins![index].num}.jpg',
                                            'skinId': champ.skins![index].id
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
                                            image: CachedNetworkImageProvider(
                                              AppConstants
                                                      .championLoadingImageUrl +
                                                  champ.id! +
                                                  '_${champ.skins![index].num}.jpg',
                                              cacheKey: champ.skins![index].id,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      champ.skins![index].name!,
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
