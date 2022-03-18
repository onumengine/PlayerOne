import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/views/activities/home_activity.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.HOME:
        return MaterialPageRoute(
          builder: (_) => HomeActivity(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
