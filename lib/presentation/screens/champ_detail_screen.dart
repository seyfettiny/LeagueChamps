import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../app/constants/app_constants.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/translations/locale_keys.g.dart';
import '../../domain/entities/champion_detailed.dart';
import '../viewmodels/champion_detail_viewmodel.dart';
import '../widgets/champion_detailed_header.dart';
import '../widgets/blurred_appbar.dart';
import '../widgets/champion_spells_widget.dart';
import '../widgets/champion_skin_list_widget.dart';
import '../widgets/champion_tips_widget.dart';

class ChampDetailScreen extends StatefulWidget {
  final String champId;
  final String champName;
  final String champTitle;

  const ChampDetailScreen({
    Key? key,
    required this.champId,
    required this.champName,
    required this.champTitle,
  }) : super(key: key);

  @override
  State<ChampDetailScreen> createState() => _ChampDetailScreenState();
}

class _ChampDetailScreenState extends State<ChampDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0,
      upperBound: 0.1,
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var versionNotifier = context.read<VersionNotifier>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: BlurredAppBar(
        name: widget.champName,
        title: widget.champTitle,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: CachedNetworkImageProvider(
              AppConstants.championLoadingImageUrl +
                  (widget.champId == 'Fiddlesticks'
                      ? 'FiddleSticks'
                      : widget.champId) +
                  '_0.jpg',
              cacheKey: AppConstants.championLoadingImageUrl +
                  versionNotifier.currentVersion +
                  (widget.champId == 'Fiddlesticks'
                      ? 'FiddleSticks'
                      : widget.champId) +
                  '_0.jpg',
            ),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            padding: const EdgeInsets.only(top: 120, left: 16, right: 16),
            width: double.infinity,
            color:
                Theme.of(context).cardTheme.surfaceTintColor!.withOpacity(0.5),
            child: Consumer<ChampionDetailViewModel>(
              builder: (context, viewModel, child) {
                return FutureBuilder(
                  future: viewModel.getChampion(widget.champId,
                      versionNotifier.currentVersion, context.locale),
                  builder: (context, asyncSnapshot) {
                    if (!asyncSnapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    ChampDetailed champ = asyncSnapshot.data as ChampDetailed;
                    _controller.forward();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              versionNotifier.currentVersion.toString(),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          ChampDetailedHeader(champ: champ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: _controller.value * 10,
                            curve: Curves.easeInOut,
                            child: AnimatedSlide(
                              curve: Curves.easeInOut,
                              offset: Offset(
                                  (_controller.upperBound) - _controller.value,
                                  0),
                              duration: const Duration(milliseconds: 500),
                              child: Html(
                                data: champ.lore,
                              ),
                            ),
                          ),
                          ChampionTipsWidget(champ: champ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12),
                            child: Text(
                              LocaleKeys.spells.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 170,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: champ.spells!.length + 1,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    child: SlideAnimation(
                                      horizontalOffset: 80,
                                      child: FadeInAnimation(
                                        child: ChampionSpellsWidget(
                                            index: index,
                                            champ: champ,
                                            context: context),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12),
                            child: Text(
                              LocaleKeys.skins.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          ChampionSkinListWidget(champ: champ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
