import 'package:leaguechamps/domain/use_cases/get_champion_list_usecase.dart';
import 'package:leaguechamps/presentation/viewmodels/home_viewmodel.dart';

import 'domain/use_cases/get_champion_usecase.dart';
import 'domain/use_cases/get_version_list_usecase.dart';
import 'domain/use_cases/get_version_usecase.dart';
import 'presentation/viewmodels/splash_viewmodel.dart';

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
  ChangeNotifierProvider<ConnectivityNotifier>(
    create: (_) => ConnectivityNotifier(),
  ),
  ChangeNotifierProvider<SearchNotifier>(
    create: (_) => SearchNotifier(),
  ),
];

List<SingleChildWidget> dependentServices = [
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
  ProxyProvider3<DataDragonAPI, HiveService, ConnectivityNotifier,
      ChampionRepository>(
    update: (_, dataDragonAPI, hiveService, connectivityNotifier, __) =>
        ChampionRepository(dataDragonAPI, hiveService, connectivityNotifier),
  ),
  ProxyProvider3<DataDragonAPI, HiveService, ConnectivityNotifier,
      VersionRepository>(
    update: (_, dataDragonAPI, hiveService, connectivityNotifier, __) =>
        VersionRepository(dataDragonAPI, hiveService, connectivityNotifier),
  ),
  ProxyProvider<VersionRepository, GetVersionUseCase>(
    update: (_, versionRepository, __) => GetVersionUseCase(versionRepository),
  ),
  ProxyProvider<VersionRepository, GetVersionListUseCase>(
    update: (_, versionRepository, __) =>
        GetVersionListUseCase(versionRepository),
  ),
  ProxyProvider<ChampionRepository, GetChampionUseCase>(
    update: (_, championRepository, __) =>
        GetChampionUseCase(championRepository),
  ),
  ProxyProvider<ChampionRepository, GetChampionListUseCase>(
    update: (_, championRepository, __) =>
        GetChampionListUseCase(championRepository),
  ),
  // ProxyProvider2<GetVersionUseCase, GetVersionListUseCase, SplashViewModel>(
  //   update: (_, getVersionUseCase, getVersionListUseCase, __) =>
  //       SplashViewModel(getVersionUseCase, getVersionListUseCase),
  // ),
  ChangeNotifierProvider<SplashViewModel>(
    create: (context) => SplashViewModel(
      Provider.of<GetVersionUseCase>(context, listen: false),
      Provider.of<GetVersionListUseCase>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(
      Provider.of<GetChampionListUseCase>(context, listen: false),
    ),
  ),
];
