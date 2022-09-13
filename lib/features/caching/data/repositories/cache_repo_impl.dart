import 'package:player_one/core/error/failure.dart';
import 'package:player_one/features/caching/data/data_sources/cache_data_source.dart';
import 'package:player_one/features/caching/domain/entities/cached.dart';
import 'package:player_one/features/caching/domain/repositories/cache_repository.dart';

class CacheRepoImpl implements CacheRepository {
  final CacheDataSource dataSource;

  CacheRepoImpl({required this.dataSource});

  @override
  Future fetch(String key) async {
    return (dataSource.fetch(key) as CachedEntity);
  }

  @override
  Future save(String key, String value) async {
    return ((await dataSource.save(key, value) as CachedEntity));
  }

  @override
  Future readState() async {
    try {
      Map<String, dynamic> state = {};
      state['trackIsLoaded'] = fetch('trackIsLoaded');
      state['title'] = fetch('title');
      state['artist'] = fetch('artist');
      state['duration'] = fetch('duration');
      state['progress'] = fetch('progress');
      state['shuffle'] = fetch('shuffle');
      state['repeatMode'] = fetch('repeatMode');
      state['albumArt'] = fetch('albumArt');
      state['isPlaying'] = fetch('isPlaying');
      return CachedEntity(data: state);
    } on Exception catch (e) {
      return CachingFailure(description: e.toString());
    }
  }

  @override
  Future saveState(state) async {
    try {
      Map<String, dynamic> stateMap = state as Map<String, dynamic>;
      for (String key in stateMap.keys) {
        save(key, stateMap[key]);
      }
      return CachedEntity(data: stateMap);
    } on Exception catch (e) {
      return CachingFailure(description: e.toString());
    }
  }
}
