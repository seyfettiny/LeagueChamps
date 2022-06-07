import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../app/translations/locale_keys.g.dart';
import '../../domain/entities/champion_detailed.dart';

class ChampionTipsWidget extends StatelessWidget {
  final ChampDetailed champ;
  const ChampionTipsWidget({Key? key, required this.champ}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: champ.allytips!.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Text(
                  LocaleKeys.allyTips.tr(namedArgs: {"champion": champ.name!}),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              SizedBox(
                height: 110,
                child: AnimationLimiter(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: PageController(
                      viewportFraction: 0.96,
                    ),
                    itemCount: champ.allytips!.length,
                    itemBuilder: (BuildContext context, index) =>
                        AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        curve: Curves.easeOutExpo,
                        horizontalOffset: 100,
                        child: FadeInAnimation(
                          child: Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(right: 24),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  champ.allytips![index],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: champ.enemytips!.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Text(
                  LocaleKeys.enemyTips.tr(namedArgs: {"champion": champ.name!}),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
              SizedBox(
                height: 110,
                child: AnimationLimiter(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: PageController(
                      viewportFraction: 0.96,
                    ),
                    itemCount: champ.enemytips!.length,
                    itemBuilder: (BuildContext context, index) =>
                        AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1400),
                      child: SlideAnimation(
                        curve: Curves.easeOutExpo,
                        horizontalOffset: 100,
                        child: FadeInAnimation(
                          child: Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(right: 24),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  champ.enemytips![index],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
