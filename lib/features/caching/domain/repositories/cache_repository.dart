abstract class CacheRepository {
  Future save(String key, String value);
  Future fetch(String key);
  Future saveState(dynamic state);
  Future readState();
}
