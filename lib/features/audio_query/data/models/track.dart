import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:player_one/core/utils/helpers.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';

class TrackModel extends TrackEntity {
  final String title, artist, filePath, albumArtPath;
  final String duration;

  const TrackModel({
    required this.title,
    required this.artist,
    required this.filePath,
    required this.duration,
    required this.albumArtPath,
  }) : super(
          title: title,
          artist: artist,
          filePath: filePath,
          duration: duration,
      albumArtPath: albumArtPath,
        );

  factory TrackModel.fromSongInfo(SongInfo object) {
    return TrackModel(
      title: object.title,
      artist: object.artist,
      filePath: object.filePath,
      duration: changeToFormattedDuration(object.duration),
      albumArtPath: object.albumArtwork
    );
  }
}
