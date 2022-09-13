import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/features/playback/data/data_sources/player.dart';
import 'package:player_one/features/playback/data/models/playing_track.dart';
import 'package:player_one/features/playback/domain/repositories/player_repository.dart';

class PlaybackRepository implements PlayerRepository {
  final PlaybackDataSource dataSource;

  PlaybackRepository({required this.dataSource});

  @override
  Future next() async {
    // TODO: implement next
    throw UnimplementedError();
  }

  @override
  Future pause() async {
    await dataSource.pause();
  }

  @override
  Future<Either<PlaybackFailure, PlayingTrackModel>> play(
      String filePath) async {
    try {
      var duration = await dataSource.play(filePath);
      return Right(PlayingTrackModel.fromJSON(filePath, duration));
    } on Exception catch (e) {
      return Left(PlaybackFailure(description: e.toString()));
    }
  }

  @override
  Future previous() {
    // TODO: implement previous
    throw UnimplementedError();
  }

  @override
  Future resume() async {
    await dataSource.resume();
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
