import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lolwiki/ui/notifiers/theme_notifier.dart';
import 'package:lolwiki/ui/themes/dark_theme.dart';
import 'package:lolwiki/ui/themes/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();

  runApp(
    MultiProvider(
      //TODO: Extract providers to seperate folder
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(lightTheme),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Material App',
      theme: themeNotifier.getTheme,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  themeNotifier.setTheme(themeNotifier.getTheme);
                },
                icon: themeNotifier.getTheme == darkTheme
                    ? const Icon(Icons.nightlight_round_outlined)
                    : const Icon(Icons.wb_sunny_outlined))
          ],
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World '),
        ),
      ),
    );
  }
}
