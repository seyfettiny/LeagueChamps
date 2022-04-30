import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../domain/entities/champion.dart';
import '../notifiers/version_notifier.dart';

class ChampionListItem extends StatelessWidget {
  final Champion champion;
  const ChampionListItem({Key? key, required this.champion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final versionNotifier = Provider.of<VersionNotifier>(context);
    return InkWell(
      onTap: () {
        print(champion.id);
        Navigator.pushNamed(context, RoutePaths.champDetail,
            arguments: {'champId': champion.id});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 120,
              child: CachedNetworkImage(
                imageUrl: champion.image!.full != null
                    ? AppConstants.championAPIBaseUrl +
                        versionNotifier.currentVersion +
                        AppConstants.championImageRoute +
                        champion.image!.full!
                    : '',
                cacheKey: champion.image!.full != null
                    ? champion.image!.full! + versionNotifier.currentVersion
                    : '',
              ),
            ),
            Expanded(
              child: Column(
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
                      Flexible(
                        child: Text(
                          champion.title!,
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
                    champion.tags!.join(', '),
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    champion.blurb!.toString(),
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
  }
}
