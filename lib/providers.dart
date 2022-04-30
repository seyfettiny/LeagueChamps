import 'domain/use_cases/get_champion_list_usecase.dart';
import 'domain/use_cases/get_champion_usecase.dart';
import 'domain/use_cases/get_version_list_usecase.dart';
import 'domain/use_cases/get_version_usecase.dart';

import 'data/data_sources/data_dragon.dart';
import 'data/data_sources/hive_service.dart';
import 'data/repositories/champion_repository.dart';
import 'data/repositories/version_repository.dart';
import 'app/utils/connectivity_service.dart';

import 'presentation/notifiers/search_notifier.dart';
import 'presentation/notifiers/version_notifier.dart';
import 'presentation/notifiers/theme_notifier.dart';

import 'presentation/viewmodels/splash_viewmodel.dart';
import 'presentation/viewmodels/home_viewmodel.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
  Provider<ConnectivityService>(
    create: (_) => ConnectivityService(),
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
  ProxyProvider3<DataDragonAPI, HiveService, ConnectivityService,
      ChampionRepository>(
    update: (_, dataDragonAPI, hiveService, connectivityService, __) =>
        ChampionRepository(dataDragonAPI, hiveService, connectivityService),
  ),
  ProxyProvider3<DataDragonAPI, HiveService, ConnectivityService,
      VersionRepository>(
    update: (_, dataDragonAPI, hiveService, connectivityService, __) =>
        VersionRepository(dataDragonAPI, hiveService, connectivityService),
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
