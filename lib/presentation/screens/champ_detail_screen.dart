import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/constants/app_constants.dart';
import '../../app/notifiers/version_notifier.dart';
import '../../app/routing/route_paths.dart';
import '../../data/repositories/champion_repository.dart';
import '../../domain/entities/champion_detailed.dart';
import '../widgets/blurred_appbar.dart';
import '../widgets/champion_info_widget.dart';
import '../widgets/champion_spells_widget.dart';

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
  late final Animation _animation;
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
    var championRepository = Provider.of<ChampionRepository>(context);
    var versionNotifier = Provider.of<VersionNotifier>(context);
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
            color: Colors.black.withOpacity(0.2),
            child: FutureBuilder(
                //TODO: switch this future to the one from ChampionDetailScreenViewModel

                future: championRepository.getDetailedChampion(widget.champId,
                    versionNotifier.currentVersion, context.locale),
                builder: (context, asyncSnapshot) {
                  if (!asyncSnapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  ChampDetailed champ = asyncSnapshot.data as ChampDetailed;
                  // var champDefaultSkin =
                  //     '${champ.skins!.where((element) => element.num == 0).first.num}';
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 16),
                              child: ChampionInfoWidget(champ: champ),
                            ),
                            Flexible(
                              child: SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: champ.tags!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      child: SlideAnimation(
                                        horizontalOffset: 20,
                                        child: FadeInAnimation(
                                          child: Tooltip(
                                            message: champ.tags![index],
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

                        // Text(
                        //   '\n partype: ${champ.partype}',
                        //   style: Theme.of(context).textTheme.bodyMedium,
                        // ),
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
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '${champ.lore}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: champ.allytips!.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 12),
                                child: Text(
                                  'Ally tips',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xffc6a66a),
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
                                    itemBuilder: (BuildContext context,
                                            index) =>
                                        AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      child: SlideAnimation(
                                        curve: Curves.easeOutExpo,
                                        horizontalOffset: 100,
                                        child: FadeInAnimation(
                                          child: Card(
                                            margin: const EdgeInsets.only(
                                                right: 24),
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              side: const BorderSide(
                                                color: Color(0xffc6a66a),
                                                width: 2,
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  champ.allytips![index],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 5,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 12),
                                child: Text(
                                  'Enemy tips',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xffc6a66a),
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
                                    itemBuilder: (BuildContext context,
                                            index) =>
                                        AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 1400),
                                      child: SlideAnimation(
                                        curve: Curves.easeOutExpo,
                                        horizontalOffset: 100,
                                        child: FadeInAnimation(
                                          child: Card(
                                            margin: const EdgeInsets.only(
                                                right: 24),
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              side: const BorderSide(
                                                color: Color(0xffc6a66a),
                                                width: 2,
                                              ),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  champ.enemytips![index],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 5,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 12),
                          child: Text(
                            'Spells',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffc6a66a),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: champ.spells!.length + 1,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1000),
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
                            'Skins',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffc6a66a),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 350,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: champ.skins!.length,
                            itemBuilder: (context, index) {
                              var champSkin = champ.skins![index];
                              return Tooltip(
                                message: champSkin.name,
                                triggerMode: TooltipTriggerMode.longPress,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutePaths.skinOverview,
                                      arguments: {
                                        'skinUrl': AppConstants
                                                .championLoadingImageUrl +
                                            champ.id! +
                                            '_${champSkin.num}.jpg',
                                        'skinId': champSkin.id,
                                        'skinName': champSkin.name
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    width: 160,
                                    height: 300,
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: AppConstants
                                                  .championLoadingImageUrl +
                                              champ.id! +
                                              '_${champSkin.num}.jpg',
                                          cacheKey: champSkin.id! +
                                              versionNotifier.currentVersion,
                                          fit: BoxFit.cover,
                                          fadeInDuration:
                                              const Duration(milliseconds: 100),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            child: Container(
                                              width: 160,
                                              height: 290,
                                              color: Colors.black,
                                            ),
                                            baseColor: Colors.grey[800]!,
                                            highlightColor: Colors.grey[600]!,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 160,
                                          child: Text(
                                            champSkin.name! == 'default'
                                                ? ''
                                                : champSkin.name!,
                                            softWrap: true,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
