import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/playback/domain/repositories/player_repository.dart';

class Play implements UseCase<List<TrackEntity>, PlayParams> {
  final PlayerRepository playerRepository;

  Play({required this.playerRepository});

  @override
  Future<Either<MusicFetchingFailure, List<TrackEntity>>> call(PlayParams params) async {
    return await playerRepository.play(params.filePath);
  }
}

class PlayParams extends Params {
  final String filePath;

  PlayParams({required this.filePath});

  @override
  List<Object?> get props => [filePath];
}
