import 'package:leaguechamps/domain/use_cases/get_champion_list_usecase.dart';
import 'package:leaguechamps/domain/use_cases/get_champion_usecase.dart';
import 'package:leaguechamps/domain/use_cases/get_version_list_usecase.dart';
import 'package:leaguechamps/domain/use_cases/get_version_usecase.dart';

import 'data/data_sources/data_dragon.dart';
import 'data/data_sources/hive_service.dart';
import 'data/repositories/champion_repository.dart';
import 'data/repositories/version_repository.dart';
import 'presentation/notifiers/connectivity_notifier.dart';
import 'presentation/notifiers/search_notifier.dart';
import 'presentation/notifiers/version_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'presentation/notifiers/theme_notifier.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider<DataDragonAPI>(
    create: (_) => DataDragonAPI(),
  ),
  Provider<HiveService>(
    create: (_) => HiveService(),
  ),
  ChangeNotifierProvider<ThemeNotifier>(
    create: (context) => ThemeNotifier(
      Provider.of<HiveService>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider<VersionNotifier>(
    create: (context) => VersionNotifier(
      Provider.of<HiveService>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider<ConnectivityNotifier>(
    create: (_) => ConnectivityNotifier(),
  ),
  ChangeNotifierProvider<SearchNotifier>(
    create: (_) => SearchNotifier(),
  ),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<DataDragonAPI, ChampionRepository>(
    update: (_, dataDragonAPI, __) => ChampionRepository(dataDragonAPI),
  ),
  ProxyProvider2<DataDragonAPI, HiveService, VersionRepository>(
    update: (_, dataDragonAPI, hiveService, __) =>
        VersionRepository(dataDragonAPI, hiveService),
  ),
  ProxyProvider2<ChampionRepository, HiveService, GetVersionUserCase>(
    update: (_, championRepository, hiveService, __) =>
        GetVersionUserCase(championRepository, hiveService),
  ),
  ProxyProvider2<ChampionRepository, HiveService, GetVersionListUseCase>(
    update: (_, championRepository, hiveService, __) =>
        GetVersionListUseCase(championRepository, hiveService),
  ),
  ProxyProvider3<ChampionRepository, HiveService, VersionNotifier,
      GetChampionUseCase>(
    update: (_, championRepository, hiveService, versionNotifier, __) =>
        GetChampionUseCase(championRepository, hiveService, versionNotifier),
  ),
  ProxyProvider3<ChampionRepository, HiveService, VersionNotifier,
      GetChampionListUseCase>(
    update: (_, championRepository, hiveService, versionNotifier, __) =>
        GetChampionListUseCase(
            championRepository, hiveService, versionNotifier),
  ),
];
