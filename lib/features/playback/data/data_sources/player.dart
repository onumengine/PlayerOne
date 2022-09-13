import 'package:just_audio/just_audio.dart';

abstract class PlaybackDataSource {
  Future play(String songPath);

  Future pause();

  Future resume();

  Future seek(int duration);

  Future stop();
}

class Player implements PlaybackDataSource {
  final AudioPlayer audioPlayer;

  Player({required this.audioPlayer});

  @override
  Future pause() async {
    await audioPlayer.pause();
  }

  @override
  Future play(String filePath) async {
    final duration = await audioPlayer
        .setUrl(filePath); // Play without waiting for completion
    await audioPlayer.play();
  }

  @override
  Future resume() async {
    await audioPlayer.play();
  }

  @override
  Future seek(int duration) async {
    await audioPlayer.seek(
      Duration(seconds: duration),
    );
  }

  @override
  Future stop() async {
    await audioPlayer.stop();
  }
}
