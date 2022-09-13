import 'package:player_one/features/playback/domain/entities/playing_track.dart';

class PlayingTrackModel extends PlayingTrackEntity {
  final String filePath;
  final duration;

  PlayingTrackModel({required this.filePath, required this.duration})
      : super(filePath: filePath, duration: duration);

  factory PlayingTrackModel.fromJSON(String filePath, dynamic duration) {
    return PlayingTrackModel(filePath: filePath, duration: duration);
  }
}
