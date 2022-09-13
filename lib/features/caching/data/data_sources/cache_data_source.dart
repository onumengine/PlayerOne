import 'package:player_one/core/error/failure.dart';
import 'package:player_one/features/caching/data/models/cached.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheDataSource {
  Future save(String key, String value);
  Future fetch(String key);
}

class CacheDatabase implements CacheDataSource {
  final SharedPreferences prefs;

  CacheDatabase({required this.prefs});

  @override
  Future fetch(String key) async {
    try {
      return CachedModel(data: prefs.get(key));
    } on Exception catch (e) {
      return CachingFailure(description: e.toString());
    }
  }

  @override
  Future save(String key, String value) async {
    try {
      return CachedModel(data: await prefs.setString(key, value));
    } on Exception catch (e) {
      return CachingFailure(description: e.toString());
    }
  }
}
