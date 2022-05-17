import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/routing/route_paths.dart';
import '../../domain/entities/champion.dart';

class ChampionListItem extends StatelessWidget {
  final Champion champion;
  const ChampionListItem({Key? key, required this.champion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final versionNotifier = Provider.of<VersionNotifier>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      borderOnForeground: false,
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutePaths.champDetail,
                arguments: {'champId': champion.id});
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // child: CachedNetworkImage(
              //   imageUrl: champion.image!.full != null
              //       ? AppConstants.championAPIBaseUrl +
              //           versionNotifier.currentVersion +
              //           AppConstants.championImageRoute +
              //           champion.image!.full!
              //       : '',
              //   cacheKey: champion.image!.full != null
              //       ? champion.image!.full! + versionNotifier.currentVersion
              //       : '',
              // ),

              // Had to add this check for fiddlesticks because it has the name "FiddleSticks" at cdn
              // instead of ${champion.id} like every other champion.
              CachedNetworkImage(
                imageUrl: AppConstants.championCenteredImageUrl +
                    (champion.id! == 'Fiddlesticks'
                        ? 'FiddleSticks'
                        : champion.id!) +
                    '_0.jpg',
                cacheKey: AppConstants.championCenteredImageUrl +
                    versionNotifier.currentVersion +
                    (champion.id! == 'Fiddlesticks'
                        ? 'FiddleSticks'
                        : champion.id!) +
                    '_0.jpg',
              ),
              Positioned(
                height: 250,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withAlpha(250),
                        Colors.black.withAlpha(80),
                        Colors.black.withAlpha(0),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 90,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            champion.name! + ', ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Expanded(
                            child: Text(
                              champion.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ...champion.tags!.map((tag) {
                            return Tooltip(
                              triggerMode: TooltipTriggerMode.tap,
                              message: tag.toString(),
                              child: Image(
                                height: 30,
                                width: 30,
                                image: AssetImage(
                                    'assets/champ_classes/${tag}_icon.png'),
                              ),
                            );
                          })
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            champion.blurb!.toString(),
                            style: Theme.of(context).textTheme.labelMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
