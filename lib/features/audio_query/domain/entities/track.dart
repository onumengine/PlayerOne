import 'package:equatable/equatable.dart';

class TrackEntity extends Equatable {
  // TODO: Add fields 'duration' and 'filepath'
  final String title, artist;

  const TrackEntity({
    required this.title,
    required this.artist,
  });

  @override
  List<Object?> get props => [title, artist];
}
