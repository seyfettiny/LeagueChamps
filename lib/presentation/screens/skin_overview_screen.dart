import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/notifiers/version_notifier.dart';

class SkinOverViewScreen extends StatelessWidget {
  final String skinId;
  final String skinUrl;
  final String skinName;
  const SkinOverViewScreen(
      {Key? key,
      required this.skinUrl,
      required this.skinId,
      required this.skinName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final versionNotifier = Provider.of<VersionNotifier>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: skinName == 'default' ? const Text('') : Text(skinName),
        backgroundColor: Colors.black.withAlpha(80),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  skinUrl,
                  cacheKey: skinId + versionNotifier.currentVersion,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
