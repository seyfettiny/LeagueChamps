import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/version_notifier.dart';

class SkinOverViewScreen extends StatelessWidget {
  final String skinId;
  final String skin;
  const SkinOverViewScreen({Key? key, required this.skin, required this.skinId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final versionNotifier = Provider.of<VersionNotifier>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            skin,
            cacheKey: skinId+versionNotifier.currentVersion,
          ),
        ),
      ),
    );
  }
}
