abstract class PlayerRepository {
  Future next();
  Future pause();
  Future play(String musicFilePath);
  Future resume();
  Future previous();
  Future seek(int duration);
  Future stop();
}
