import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/translations/locale_keys.g.dart';
import '../../domain/entities/champion_detailed.dart';
import 'champion_info_painter.dart';

class ChampionInfoWidget extends StatefulWidget {
  final ChampDetailed champ;
  const ChampionInfoWidget({
    Key? key,
    required this.champ,
  }) : super(key: key);

  @override
  State<ChampionInfoWidget> createState() => _ChampionInfoWidgetState();
}

class _ChampionInfoWidgetState extends State<ChampionInfoWidget>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController controller;
  final Tween<double> _tween = Tween<double>(begin: 0, end: 1);
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    animation = _tween.animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutQuint))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          LocaleKeys.attack.tr() + ': ' + widget.champ.info!.attack.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomPaint(
          painter: ChampInfoPainter(
            info: widget.champ.info!.attack!.toDouble(),
            animation: animation.value,
          ),
          size: Size(MediaQuery.of(context).size.width * 0.66, 30),
        ),
        Text(
          LocaleKeys.defense.tr() +
              ': ' +
              widget.champ.info!.defense.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomPaint(
          painter: ChampInfoPainter(
            info: widget.champ.info!.defense!.toDouble(),
            animation: animation.value,
          ),
          size: Size(MediaQuery.of(context).size.width * 0.66, 30),
        ),
        Text(
          LocaleKeys.magic.tr() + ': ' + widget.champ.info!.magic.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomPaint(
          painter: ChampInfoPainter(
            info: widget.champ.info!.magic!.toDouble(),
            animation: animation.value,
          ),
          size: Size(MediaQuery.of(context).size.width * 0.66, 30),
        ),
        Text(
          LocaleKeys.difficulty.tr() +
              ': ' +
              widget.champ.info!.difficulty.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomPaint(
          painter: ChampInfoPainter(
            info: widget.champ.info!.difficulty!.toDouble(),
            animation: animation.value,
          ),
          size: Size(MediaQuery.of(context).size.width * 0.66, 30),
        ),
      ],
    );
  }
}
