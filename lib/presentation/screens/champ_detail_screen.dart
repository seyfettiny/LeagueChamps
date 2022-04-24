import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/data/models/champion_detailed_model.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../domain/entities/champion_detailed.dart';
import '../widgets/blurred_appbar.dart';

class ChampDetailScreen extends StatelessWidget {
  final ChampDetailed champ;
  final String skinId;
  const ChampDetailScreen({
    Key? key,
    required this.champ,
    required this.skinId,
  }) : super(key: key);
  ChampDetailedModel champDetailed() {
    return ChampDetailedModel();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Extract paddings/margins to constants
    return Hero(
      tag: skinId,
      child: Scaffold(
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
                    '_${champ.skins!.where((element) => element.id == skinId).first.num}.jpg',
                cacheKey: skinId,
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
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Q: ',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                champ.spells![0].name!,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'partype: ${champ.partype}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Lore: ${champ.lore}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'allytips: ${champ.allytips}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'enemytips: ${champ.enemytips}',
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
                                    margin: const EdgeInsets.only(right: 16),
                                    width: 140,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                          AppConstants.championLoadingImageUrl +
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
      ),
    );
  }
}
