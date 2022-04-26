import 'data/data_sources/data_dragon.dart';
import 'data/data_sources/hive_service.dart';
import 'data/repositories/champion_repository.dart';
import 'data/repositories/version_repository.dart';
import 'domain/use_cases/champions_use_case.dart';
import 'domain/use_cases/version_use_case.dart';
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
  ProxyProvider<DataDragonAPI, VersionRepository>(
    update: (_, dataDragonAPI, __) => VersionRepository(dataDragonAPI),
  ),
  ProxyProvider<DataDragonAPI, ChampionRepository>(
    update: (_, dataDragonAPI, __) => ChampionRepository(dataDragonAPI),
  ),
  ProxyProvider2<ChampionRepository, HiveService, ChampionUseCase>(
    update: (_, championRepository, hiveService, __) =>
        ChampionUseCase(championRepository, hiveService),
  ),
  ProxyProvider2<ChampionRepository, HiveService, VersionUseCase>(
    update: (_, championRepository, hiveService, __) =>
        VersionUseCase(championRepository, hiveService),
  ),
];
