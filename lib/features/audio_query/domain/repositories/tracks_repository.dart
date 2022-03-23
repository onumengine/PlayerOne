import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';

abstract class TracksRepository {
  Future<Either<MusicFetchingFailure, List<TrackEntity>>> fetchTracks();
}