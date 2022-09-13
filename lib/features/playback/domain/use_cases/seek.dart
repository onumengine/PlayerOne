import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/playback/domain/repositories/player_repository.dart';

class Seek implements UseCase<List<TrackEntity>, SeekParams> {
  final PlayerRepository playerRepository;

  Seek({required this.playerRepository});

  @override
  Future<Either<MusicFetchingFailure, List<TrackEntity>>> call(
      SeekParams params) async {
    return await playerRepository.seek(params.duration);
  }
}

class SeekParams extends Params {
  final int duration;

  SeekParams({required this.duration});

  @override
  List<Object?> get props => [duration];
}
