import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../app/translations/locale_keys.g.dart';
import '../../domain/entities/champion_detailed.dart';
import 'champion_info_widget.dart';
import 'champion_stats_widget.dart';

class ChampDetailedHeader extends StatelessWidget {
  final ChampDetailed champ;
  const ChampDetailedHeader({Key? key, required this.champ}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 270,
      child: PageView(
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                child: Row(
                  children: const [
                    Text('Stats'),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  child: ChampionInfoWidget(champ: champ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: champ.tags!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 600),
                        child: SlideAnimation(
                          horizontalOffset: 20,
                          child: FadeInAnimation(
                            child: Tooltip(
                              message:
                                  '${LocaleKeys.champClasses}.${champ.tags![index]}'
                                      .tr(),
                              triggerMode: TooltipTriggerMode.tap,
                              child: Image(
                                image: AssetImage(
                                  'assets/champ_classes/${champ.tags![index]}_icon.png',
                                ),
                                height: 36,
                                width: 36,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          ChampStatsWidget(stats: champ.stats!)
        ],
      ),
    );
  }
}
