import 'package:equatable/equatable.dart';
import 'package:player_one/features/caching/domain/entities/state.dart';

class StateModel extends StateEntity {
  String? albumArt;
  String? artist;
  Duration? duration;
  bool? isPlaying;
  double? progress;
  String? repeatMode;
  bool? shuffle;
  String? title;
  bool? trackIsLoaded;

  StateModel({
    this.albumArt,
    this.artist,
    this.duration,
    this.isPlaying,
    this.progress,
    this.repeatMode,
    this.shuffle,
    this.title,
    this.trackIsLoaded,
  }) : super(
          albumArt: albumArt,
          artist: artist,
          duration: duration,
          isPlaying: isPlaying,
          progress: progress,
          repeatMode: repeatMode,
          shuffle: shuffle,
          title: title,
          trackIsLoaded: trackIsLoaded,
        );
}
