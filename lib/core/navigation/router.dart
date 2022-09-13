import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/views/activities/home_activity.dart';
import 'package:player_one/views/activities/now_playing_activity.dart';
import 'package:player_one/views/activities/search_activity.dart';
import 'package:player_one/views/activities/tracks_activity.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.HOME:
        return MaterialPageRoute(
          builder: (_) => const HomeActivity(),
        );
      case RouteNames.NOW_PLAYING:
        return MaterialPageRoute(
          builder: (_) => const NowPlayingActivity(),
        );
      case RouteNames.SEARCH:
        return MaterialPageRoute(
          builder: (_) => SearchActivity(),
        );
      case RouteNames.TRACKS:
        return MaterialPageRoute(
          builder: (_) => const TracksActivity(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
