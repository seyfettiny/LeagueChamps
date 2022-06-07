import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/constants/app_constants.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/routing/route_paths.dart';
import '../../domain/entities/champion_detailed.dart';

class ChampionSkinListWidget extends StatelessWidget {
  final ChampDetailed champ;
  const ChampionSkinListWidget({Key? key, required this.champ})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var versionNotifier = context.read<VersionNotifier>();

    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: champ.skins!.length,
        itemBuilder: (context, index) {
          var champSkin = champ.skins![index];
          return Tooltip(
            message: champSkin.name,
            triggerMode: TooltipTriggerMode.longPress,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.skinOverview,
                  arguments: {
                    'skinUrl': AppConstants.championLoadingImageUrl +
                        champ.id! +
                        '_${champSkin.num}.jpg',
                    'skinId': champSkin.id,
                    'skinName': champSkin.name
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 160,
                height: 300,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: AppConstants.championLoadingImageUrl +
                          champ.id! +
                          '_${champSkin.num}.jpg',
                      cacheKey: champSkin.id! + versionNotifier.currentVersion,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 100),
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: Container(
                          width: 160,
                          height: 290,
                          color: Colors.black,
                        ),
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[600]!,
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        champSkin.name! == 'default' ? '' : champSkin.name!,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
