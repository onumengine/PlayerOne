import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/views/activities/home_activity.dart';
import 'package:player_one/views/activities/now_playing_activity.dart';
import 'package:player_one/views/activities/search_activity.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.HOME:
        return MaterialPageRoute(
          builder: (_) => HomeActivity(),
        );
      case RouteNames.NOW_PLAYING:
        return MaterialPageRoute(builder: (_) => NowPlayingActivity(),);
      case RouteNames.SEARCH:
        return MaterialPageRoute(builder: (_) => SearchActivity(),);
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
