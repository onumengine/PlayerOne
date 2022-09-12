import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/core/navigation/router.dart';
import 'package:player_one/core/theming/themes.dart';
import 'package:player_one/service_locator.dart' as service_locator;

void main() {
  service_locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Player One',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: RouteNames.TRACKS,
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
    );
  }
}
