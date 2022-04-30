import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/routing/route_paths.dart';
import '../../domain/entities/champion.dart';
import '../notifiers/version_notifier.dart';

class ChampionSearchItem extends StatelessWidget {
  const ChampionSearchItem({
    Key? key,
    required this.champion,
  }) : super(key: key);

  final Champion champion;

  @override
  Widget build(BuildContext context) {
    var versionNotifier = Provider.of<VersionNotifier>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            //TODO:  BUG champ image returns null
            imageUrl: champion.image!.full != null
                ? AppConstants.championAPIBaseUrl +
                    versionNotifier.currentVersion +
                    AppConstants.championImageRoute +
                    champion.image!.full!
                : '',
            cacheKey: champion.image!.full != null
                ? champion.image!.full! + versionNotifier.currentVersion
                : '',
            errorWidget: (context, url, error) {
              print(champion.image!.full);

              return const SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                ),
              );
            },
            placeholder: (context, url) => const SizedBox(
              width: 56,
              height: 56,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        title: Text(champion.name!),
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.champDetail,
            arguments: {'champId': champion.id},
          );
        },
      ),
    );
  }
}
