import 'package:equatable/equatable.dart';

class TrackEntity extends Equatable {
  final String title, artist, filePath, albumArtPath;
  final String duration;

  const TrackEntity({
    required this.title,
    required this.artist,
    required this.filePath,
    required this.duration,
    this.albumArtPath = 'assets/images/genre1.png',
  });

  @override
  List<Object?> get props => [
        title,
        artist,
        filePath,
        duration,
        albumArtPath,
      ];
}
