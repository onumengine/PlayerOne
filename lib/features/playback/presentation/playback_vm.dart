import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:player_one/core/utils/mock_data.dart';
import 'package:player_one/features/playback/domain/use_cases/play.dart';
import 'package:player_one/features/playback/domain/use_cases/playback.dart';

enum RepeatMode {
  off,
  single,
  all,
}

class PlaybackViewModel with ChangeNotifier {
  final Playback player;

  String _title = nowPlayingState['title'];
  String _artist = nowPlayingState['artist'];
  late Duration _duration;
  double _progress = nowPlayingState['progressPercent'];
  late bool _shuffle;
  late RepeatMode _repeatMode;
  String _albumArt = nowPlayingState['albumArt'];

  String get title => _title;
  String get artist => _artist;
  Duration get duration => _duration;
  double get progress => _progress;
  bool get shuffle => _shuffle;
  RepeatMode get repeatMode => _repeatMode;
  String get albumArt => _albumArt;

  setTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  setArtist(String newArtist) {
    _artist = newArtist;
    notifyListeners();
  }

  setDuration(Duration newDuration) {
    _duration = newDuration;
    notifyListeners();
  }

  setProgress(double newProgress) {
    _progress = newProgress;
    notifyListeners();
  }

  setShuffle(bool newShuffle) {
    _shuffle = newShuffle;
    notifyListeners();
  }

  setRepeatMode(RepeatMode newRepeatMode) {
    _repeatMode = newRepeatMode;
    notifyListeners();
  }

  setAlbumArt(String filePath) {
    _albumArt = filePath;
    notifyListeners();
  }

  PlaybackViewModel({required this.player});

  play(String filePath) {
    player.play(
      PlayParams(filePath: filePath),
    );
  }

  String _serializeState() {
    var jsonState = jsonEncode({
      'title': _title,
      'artist': _artist,
      'duration': _duration,
      'progress': _progress,
      'shuffle': _shuffle,
      'repeatMode': _repeatMode,
    });
    return jsonState;
  }

  @override
  void dispose() {
    var jsonState = _serializeState();
    //saveState(jsonState);
    super.dispose();
  }
}
