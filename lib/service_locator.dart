import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get_it/get_it.dart';
import 'package:player_one/features/audio_query/data/data_sources/music_data_source.dart';
import 'package:player_one/features/audio_query/data/repositories/tracks_repository_impl.dart';
import 'package:player_one/features/audio_query/domain/repositories/tracks_repository.dart';
import 'package:player_one/features/audio_query/domain/use_cases/get_tracks.dart';

final GetIt serviceLocator = GetIt.instance;

init() {
  initCore();
  initFeatures();
  initExternal();
}

initCore() {}

initFeatures() {
  serviceLocator.registerLazySingleton<LocalMusicDataSource>(
    () => DeviceContentProvider(
      flutterAudioQuery: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<TracksRepository>(
    () => TracksRepositoryImpl(
      musicContentProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<GetTracks>(
    () => GetTracks(
      tracksRepository: serviceLocator(),
    ),
  );
}

initExternal() {
  serviceLocator.registerLazySingleton<FlutterAudioQuery>(
    () => FlutterAudioQuery(),
  );
}
