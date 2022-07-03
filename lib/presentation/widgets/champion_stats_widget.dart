import 'package:flutter/material.dart';
import 'package:leaguechamps/app/constants/app_constants.dart';

class ChampStatsWidget extends StatelessWidget {
  final Map stats;
  const ChampStatsWidget({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 250,
      child: SizedBox.expand(
        child: Wrap(
          runAlignment: WrapAlignment.center,
          direction: Axis.vertical,
          runSpacing: 36,
          spacing: 10,
          children: [
            ...stats.entries
                .map(
                  (stat) => Row(
                    children: [
                      Tooltip(
                        triggerMode: TooltipTriggerMode.tap,
                        message: AppConstants.statsTooltip[stat.key],
                        child: Image(
                          height: 24,
                          width: 24,
                          image: AssetImage(
                              'assets/stats_icons/${AppConstants.statsIcon[stat.key]!}_icon.png'),
                          errorBuilder: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Text('  ${stat.value}'),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
