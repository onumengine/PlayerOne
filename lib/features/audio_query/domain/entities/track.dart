import 'package:equatable/equatable.dart';

class TrackEntity extends Equatable {
  final String title, artist;

  const TrackEntity({
    required this.title,
    required this.artist,
  });

  @override
  List<Object?> get props => [title, artist];
}
