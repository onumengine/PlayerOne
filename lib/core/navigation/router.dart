import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/features/audio_query/domain/use_cases/get_tracks.dart';
import 'package:player_one/features/audio_query/presentation/library_vm.dart';
import 'package:player_one/features/playback/domain/use_cases/playback.dart';
import 'package:player_one/features/playback/presentation/playback_vm.dart';
import 'package:player_one/service_locator.dart';
import 'package:player_one/views/activities/home_activity.dart';
import 'package:player_one/views/activities/now_playing_activity.dart';
import 'package:player_one/views/activities/search_activity.dart';
import 'package:player_one/views/activities/tracks_activity.dart';
import 'package:provider/provider.dart';

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
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: LibraryViewModel(
                  getTracks: serviceLocator<GetTracks>(),
                ),
              ),
              ChangeNotifierProvider.value(
                value: PlaybackViewModel(
                  player: serviceLocator<Playback>(),
                ),
              ),
            ],
            child: const TracksActivity(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
