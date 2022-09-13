import 'package:player_one/features/playback/domain/use_cases/pause.dart';
import 'package:player_one/features/playback/domain/use_cases/play.dart';
import 'package:player_one/features/playback/domain/use_cases/resume.dart';
import 'package:player_one/features/playback/domain/use_cases/seek.dart';
import 'package:player_one/features/playback/domain/use_cases/stop.dart';

class Playback {
  final Pause pause;
  final Play play;
  final Resume resume;
  final Seek seek;
  final Stop stop;

  Playback({
    required this.pause,
    required this.play,
    required this.resume,
    required this.seek,
    required this.stop,
  });
}
