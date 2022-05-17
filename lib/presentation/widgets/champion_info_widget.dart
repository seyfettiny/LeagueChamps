import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attack: ${widget.champ.info!.attack.toString()}',
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
          'Defence: ${widget.champ.info!.defense.toString()}',
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
          'Magic: ${widget.champ.info!.magic.toString()}',
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
          'Difficulty: ${widget.champ.info!.difficulty.toString()}',
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
