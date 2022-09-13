import 'package:equatable/equatable.dart';

class PlayingTrackEntity extends Equatable {
  String filePath;
  var duration;

  PlayingTrackEntity({required this.filePath, required this.duration});

  @override
  List<Object?> get props => [filePath, duration];
}
