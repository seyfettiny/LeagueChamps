import 'package:leaguechamps/data/data_sources/data_dragon.dart';
import 'package:leaguechamps/data/data_sources/hive_service.dart';
import 'package:leaguechamps/data/repositories/champion_repository.dart';
import 'package:leaguechamps/data/repositories/version_repository.dart';
import 'package:leaguechamps/domain/use_cases/champions_use_case.dart';
import 'package:leaguechamps/domain/use_cases/version_use_case.dart';
import 'package:leaguechamps/presentation/notifiers/connectivity_notifier.dart';
import 'package:leaguechamps/presentation/notifiers/version_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'presentation/notifiers/theme_notifier.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
  ),
  ChangeNotifierProvider<VersionNotifier>(
    create: (_) => VersionNotifier(),
  ),
  ChangeNotifierProvider<ConnectivityNotifier>(
    create: (_) => ConnectivityNotifier(),
  ),
  Provider.value(
    value: DataDragonAPI(),
  ),
  Provider.value(
    value: HiveService(),
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
