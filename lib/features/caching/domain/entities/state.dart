import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  bool? trackIsLoaded;
  String? title;
  String? artist;
  Duration? duration;
  double? progress;
  bool? shuffle;
  String? repeatMode;
  String? albumArt;
  bool? isPlaying;

  StateEntity({
    this.trackIsLoaded,
    this.title,
    this.artist,
    this.duration,
    this.progress,
    this.shuffle,
    this.repeatMode,
    this.albumArt,
    this.isPlaying,
  });

  @override
  List<Object?> get props => [
        trackIsLoaded,
        title,
        artist,
        duration,
        progress,
        shuffle,
        repeatMode,
        albumArt,
        isPlaying,
      ];
}
