import 'package:leaguechamps/data/data_sources/data_dragon.dart';
import 'package:leaguechamps/data/repositories/champion_repository.dart';
import 'package:leaguechamps/data/repositories/version_repository.dart';
import 'package:leaguechamps/presentation/notifiers/connectivity_notifier.dart';
import 'package:leaguechamps/presentation/notifiers/version_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'presentation/notifiers/lang_notifier.dart';
import 'presentation/notifiers/theme_notifier.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
  ChangeNotifierProvider<LangNotifier>(create: (_) => LangNotifier()),
  ChangeNotifierProvider<VersionNotifier>(create: (_) => VersionNotifier()),
  ChangeNotifierProvider(
    create: (context) {
      ConnectivityNotifier connectivityNotifier = ConnectivityNotifier();
      return connectivityNotifier;
    },
  ),
  //StreamProvider<ConnectivityResult>(create: (_) => , initialData: initialData),
  Provider.value(value: DataDragonAPI()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<DataDragonAPI, VersionRepository>(
      update: (_, dataDragonAPI, __) => VersionRepository(dataDragonAPI)),
  ProxyProvider<DataDragonAPI, ChampionRepository>(
      update: (_, dataDragonAPI, __) => ChampionRepository(dataDragonAPI)),
];
