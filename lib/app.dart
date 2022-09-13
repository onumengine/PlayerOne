import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/core/navigation/router.dart';
import 'package:player_one/core/theming/themes.dart';
import 'package:player_one/features/audio_query/domain/use_cases/get_tracks.dart';
import 'package:player_one/features/audio_query/presentation/library_vm.dart';
import 'package:player_one/features/playback/domain/use_cases/playback.dart';
import 'package:player_one/features/playback/presentation/playback_vm.dart';
import 'package:player_one/service_locator.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PlaybackViewModel(
            player: serviceLocator<Playback>(),
          ),
        ),
        ChangeNotifierProvider.value(
          value: LibraryViewModel(
            getTracks: serviceLocator<GetTracks>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Player One',
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: RouteNames.TRACKS,
        onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
      ),
    );
  }
}
