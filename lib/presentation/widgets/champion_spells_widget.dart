import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../domain/entities/champion_detailed.dart';

class ChampionSpellsWidget extends StatelessWidget {
  const ChampionSpellsWidget({
    Key? key,
    required this.index,
    required this.champ,
    required this.context,
  }) : super(key: key);

  final int index;
  final ChampDetailed champ;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final versionNotifier = Provider.of<VersionNotifier>(context);
    if (index == 0) {
      return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: AlertDialog(
                  backgroundColor: Theme.of(context)
                      .cardTheme
                      .surfaceTintColor!
                      .withAlpha(190),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    '${champ.passive!.name}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: AppConstants.championAPIBaseUrl +
                                versionNotifier.currentVersion +
                                AppConstants.championPassiveImageRoute +
                                champ.passive!.image!.full!,
                            cacheKey: champ.passive!.image!.full! +
                                versionNotifier.currentVersion,
                          ),
                        ),
                        Html(data: champ.passive!.description!),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                          MaterialLocalizations.of(context).closeButtonLabel),
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
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.championAPIBaseUrl +
                        versionNotifier.currentVersion +
                        AppConstants.championPassiveImageRoute +
                        champ.passive!.image!.full!,
                    cacheKey: champ.passive!.image!.full! +
                        versionNotifier.currentVersion,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    champ.passive!.name!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
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
                  backgroundColor: Theme.of(context)
                      .cardTheme
                      .surfaceTintColor!
                      .withAlpha(190),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    '${champSpell.name}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: AppConstants.championAPIBaseUrl +
                                versionNotifier.currentVersion +
                                AppConstants.championPassiveImageRoute +
                                champSpell.image!.full!,
                            cacheKey: champSpell.image!.full! +
                                versionNotifier.currentVersion,
                          ),
                        ),
                        Html(
                          data: champSpell.description!,
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                          MaterialLocalizations.of(context).closeButtonLabel),
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
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.championAPIBaseUrl +
                        versionNotifier.currentVersion +
                        AppConstants.championSpellsImageRoute +
                        champSpell.image!.full!,
                    cacheKey: champSpell.image!.full! +
                        versionNotifier.currentVersion,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    champSpell.name!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
