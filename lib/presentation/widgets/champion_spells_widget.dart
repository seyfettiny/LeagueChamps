import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app/constants/app_constants.dart';
import '../../domain/entities/champion_detailed.dart';

class ChampionSpellsWidget extends StatelessWidget {
  const ChampionSpellsWidget({
    Key? key,
    required this.version,
    required this.index,
    required this.champ,
    required this.context,
  }) : super(key: key);

  final String version;
  final int index;
  final ChampDetailed champ;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Container(
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.amber,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox.square(
              dimension: 80,
              child: CachedNetworkImage(
                imageUrl: AppConstants.championAPIBaseUrl +
                    '/$version/img/passive/${champ.passive!.image!.full}',
                cacheKey: champ.passive!.image!.full,
              ),
            ),
            Text(
              champ.passive!.name!,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.fade,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else {
      var champSpells = champ.spells![index - 1];
      return Container(
        margin: const EdgeInsets.all(8),
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.amber,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Column(
          children: [
            SizedBox.square(
              dimension: 80,
              child: CachedNetworkImage(
                imageUrl: AppConstants.championAPIBaseUrl +
                    '/$version/img/spell/${champSpells.image!.full}',
                cacheKey: champSpells.image!.full,
              ),
            ),
            Text(
              champSpells.name!,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.fade,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }
}
