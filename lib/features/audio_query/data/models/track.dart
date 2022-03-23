import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';

class TrackModel extends TrackEntity {
  final String title, artist;

  const TrackModel({
    required this.title,
    required this.artist,
  }) : super(title: title, artist: artist);

  factory TrackModel.fromSongInfo(SongInfo object) {
    return TrackModel(
      title: object.title,
      artist: object.artist,
    );
  }
}
