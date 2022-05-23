import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'app/notifiers/search_notifier.dart';
import 'app/notifiers/theme_notifier.dart';
import 'app/notifiers/version_notifier.dart';
import 'app/utils/connectivity_service.dart';
import 'data/data_sources/data_dragon.dart';
import 'data/data_sources/hive_service.dart';
import 'data/repositories/champion_repository.dart';
import 'data/repositories/version_repository.dart';
import 'domain/use_cases/get_champion_list_usecase.dart';
import 'domain/use_cases/get_champion_usecase.dart';
import 'domain/use_cases/get_version_list_usecase.dart';
import 'domain/use_cases/get_version_usecase.dart';
import 'presentation/viewmodels/champion_detail_viewmodel.dart';
import 'presentation/viewmodels/home_viewmodel.dart';
import 'presentation/viewmodels/splash_viewmodel.dart';
import 'package:http/http.dart' as http;

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider<http.Client>(
    create: (_) => http.Client(),
  ),
  Provider<HiveService>(
    create: (_) => HiveService(),
  ),
  ChangeNotifierProvider<ConnectivityService>(
    create: (_) => ConnectivityService(),
  ),
  ChangeNotifierProvider<SearchNotifier>(
    create: (_) => SearchNotifier(),
  ),
  ChangeNotifierProvider<VersionNotifier>(
    create: (context) => VersionNotifier(),
  ),
];

List<SingleChildWidget> dependentServices = [
  ChangeNotifierProvider<ThemeNotifier>(
    create: (context) => ThemeNotifier(
      Provider.of<HiveService>(context, listen: false),
    ),
  ),
  ProxyProvider<http.Client, DataDragonAPI>(
    update: (_, client, __) => DataDragonAPI(client),
  ),
  ProxyProvider<DataDragonAPI, ChampionRepository>(
    update: (_, dataDragonAPI, __) => ChampionRepository(
      dataDragonAPI,
    ),
  ),
  ProxyProvider<DataDragonAPI, VersionRepository>(
    update: (_, dataDragonAPI, __) => VersionRepository(dataDragonAPI),
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
  ChangeNotifierProvider<ChampionDetailViewModel>(
    create: (context) => ChampionDetailViewModel(
      Provider.of<GetChampionUseCase>(context, listen: false),
    ),
  ),
];
