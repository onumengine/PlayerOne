import 'package:player_one/features/playback/data/data_sources/player.dart';
import 'package:player_one/features/playback/domain/repositories/player_repository.dart';

class PlaybackRepository implements PlayerRepository {
  final PlaybackDataSource dataSource;

  PlaybackRepository({required this.dataSource});

  @override
  Future next() async {
    // TODO: implement next
    await dataSource.pause();
  }

  @override
  Future pause() async {
    await dataSource.pause();
  }

  @override
  Future play(String filePath) async {
    await dataSource.play(filePath);
  }

  @override
  Future previous() {
    // TODO: implement previous
    throw UnimplementedError();
  }

  @override
  Future seek(int duration) async {
    await dataSource.seek(duration);
  }

  @override
  Future stop() async {
    await dataSource.stop();
  }
}
