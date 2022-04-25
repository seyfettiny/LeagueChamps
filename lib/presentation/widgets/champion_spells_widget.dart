import 'dart:ui';

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
      return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: AlertDialog(
                  backgroundColor: Colors.black.withAlpha(25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    '${champ.passive!.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: AppConstants.championAPIBaseUrl +
                            version +
                            AppConstants.championPassiveImageRoute +
                            champ.passive!.image!.full!,
                        cacheKey: champ.passive!.image!.full,
                      ),
                      Text(champ.passive!.description!.toString()),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
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
                      version +
                      AppConstants.championPassiveImageRoute +
                      champ.passive!.image!.full!,
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
        ),
      );
    } else {
      var champSpell = champ.spells![index - 1];
      return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: AlertDialog(
                  backgroundColor: Colors.black.withAlpha(25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    '${champSpell.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CachedNetworkImage(
                        imageUrl: AppConstants.championAPIBaseUrl +
                            version +
                            AppConstants.championPassiveImageRoute +
                            champSpell.image!.full!,
                        cacheKey: champSpell.image!.full,
                      ),
                      Text(champSpell.description!.toString()),
                      Text(champSpell.tooltip!.toString()),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
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
                      version +
                      AppConstants.championSpellsImageRoute +
                      champSpell.image!.full!,
                  cacheKey: champSpell.image!.full,
                ),
              ),
              Text(
                champSpell.name!,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.fade,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  }
}
