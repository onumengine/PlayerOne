import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/features/audio_query/data/data_sources/music_data_source.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/audio_query/domain/repositories/tracks_repository.dart';

class TracksRepositoryImpl implements TracksRepository {
  final LocalMusicDataSource musicContentProvider;

  TracksRepositoryImpl({required this.musicContentProvider});

  @override
  Future<Either<MusicFetchingFailure, List<TrackEntity>>> fetchTracks() async {
    try {
      final List<TrackEntity> trackList = await musicContentProvider.fetchSongs();
      return Right(trackList);
    } catch (e) {
      return Left(MusicFetchingFailure(description: e.toString()));
    }
  }
}
