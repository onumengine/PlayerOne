import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:player_one/features/audio_query/data/data_sources/music_data_source.dart';
import 'package:player_one/features/audio_query/data/repositories/tracks_repository_impl.dart';
import 'package:player_one/features/audio_query/domain/repositories/tracks_repository.dart';
import 'package:player_one/features/audio_query/domain/use_cases/get_tracks.dart';
import 'package:player_one/features/playback/data/data_sources/player.dart';
import 'package:player_one/features/playback/data/repositories/playback_repository.dart';
import 'package:player_one/features/playback/domain/repositories/player_repository.dart';
import 'package:player_one/features/playback/domain/use_cases/play.dart';
import 'package:player_one/features/playback/domain/use_cases/playback.dart';

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
  serviceLocator.registerLazySingleton<PlaybackDataSource>(
    () => Player(
      audioPlayer: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<TracksRepository>(
    () => TracksRepositoryImpl(
      musicContentProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<PlayerRepository>(
    () => PlaybackRepository(
      dataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<GetTracks>(
    () => GetTracks(
      tracksRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Playback>(
    () => Playback(
      play: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Play>(
    () => Play(
      playerRepository: serviceLocator(),
    ),
  );
}

initExternal() {
  serviceLocator.registerLazySingleton<FlutterAudioQuery>(
    () => FlutterAudioQuery(),
  );
  serviceLocator.registerLazySingleton<AudioPlayer>(
    () => AudioPlayer(),
  );
}
