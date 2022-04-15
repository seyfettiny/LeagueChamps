import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app/constants.dart';
import '../../data/models/champion_detailed.dart';

class ChampDetailScreen extends StatelessWidget {
  final ChampDetailed champ;
  final String skinId;
  const ChampDetailScreen({
    Key? key,
    required this.champ,
    required this.skinId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: skinId,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                AppConstants.championLoadingImageUrl +
                    champ.id! +
                    '_${champ.skins!.where((element) => element.id == skinId).first.num}.jpg',
                cacheKey: skinId,
              ),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              child: Column(
                children: [
                  Text(
                    champ.info!.attack.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    champ.info!.defense.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    champ.info!.magic.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    champ.info!.difficulty.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
