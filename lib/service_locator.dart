import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:player_one/features/audio_query/data/data_sources/music_data_source.dart';
import 'package:player_one/features/audio_query/data/repositories/tracks_repository_impl.dart';
import 'package:player_one/features/audio_query/domain/repositories/tracks_repository.dart';
import 'package:player_one/features/audio_query/domain/use_cases/get_tracks.dart';
import 'package:player_one/features/caching/data/data_sources/cache_data_source.dart';
import 'package:player_one/features/caching/data/repositories/cache_repo_impl.dart';
import 'package:player_one/features/caching/domain/repositories/cache_repository.dart';
import 'package:player_one/features/caching/domain/use_cases/cache.dart';
import 'package:player_one/features/caching/domain/use_cases/fetch.dart';
import 'package:player_one/features/caching/domain/use_cases/save.dart';
import 'package:player_one/features/caching/domain/use_cases/save_state.dart';
import 'package:player_one/features/playback/data/data_sources/player.dart';
import 'package:player_one/features/playback/data/repositories/playback_repository.dart';
import 'package:player_one/features/playback/domain/repositories/player_repository.dart';
import 'package:player_one/features/playback/domain/use_cases/pause.dart';
import 'package:player_one/features/playback/domain/use_cases/play.dart';
import 'package:player_one/features/playback/domain/use_cases/playback.dart';
import 'package:player_one/features/playback/domain/use_cases/resume.dart';
import 'package:player_one/features/playback/domain/use_cases/seek.dart';
import 'package:player_one/features/playback/domain/use_cases/stop.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

init() {
  initCore();
  initFeatures();
  initExternal();
}

initCore() {}

initFeatures() {
  //Dependencies for Caching Feature
  serviceLocator.registerLazySingleton<CacheDataSource>(
    () => CacheDatabase(
      prefs: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<CacheRepository>(
    () => CacheRepoImpl(
      dataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Fetch>(
    () => Fetch(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Save>(
    () => Save(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<SaveState>(
    () => SaveState(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Cache>(
    () => Cache(
      fetch: serviceLocator(),
      save: serviceLocator(),
      saveState: serviceLocator(),
    ),
  );

  // Dependencies for Audio Query Feature
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

  // Dependencies for Playback Feature
  serviceLocator.registerLazySingleton<PlaybackDataSource>(
    () => Player(
      audioPlayer: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<PlayerRepository>(
    () => PlaybackRepository(
      dataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Pause>(
    () => Pause(
      playerRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Play>(
    () => Play(
      playerRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Resume>(
    () => Resume(
      playerRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Seek>(
    () => Seek(
      playerRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Stop>(
    () => Stop(
      playerRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<Playback>(
    () => Playback(
      pause: serviceLocator(),
      play: serviceLocator(),
      resume: serviceLocator(),
      seek: serviceLocator(),
      stop: serviceLocator(),
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
  serviceLocator.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
}
