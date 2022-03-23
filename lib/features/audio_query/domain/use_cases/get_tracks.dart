import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/audio_query/domain/repositories/tracks_repository.dart';

class GetTracks implements UseCase<List<TrackEntity>, NoParams> {
  final TracksRepository tracksRepository;

  GetTracks({required this.tracksRepository});

  @override
  Future<Either<MusicFetchingFailure, List<TrackEntity>>> call(NoParams params) async {
    return await tracksRepository.fetchTracks();
  }
}


