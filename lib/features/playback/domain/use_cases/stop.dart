import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/playback/domain/repositories/player_repository.dart';

class Stop implements UseCase<List<TrackEntity>, NoParams> {
  final PlayerRepository playerRepository;

  Stop({required this.playerRepository});

  @override
  Future<Either<MusicFetchingFailure, List<TrackEntity>>> call(
      NoParams params) async {
    return await playerRepository.stop();
  }
}
