import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:player_one/features/playback/domain/use_cases/play.dart';
import 'package:player_one/features/playback/domain/use_cases/playback.dart';

enum RepeatMode {
  off,
  single,
  all,
}

class PlaybackViewModel with ChangeNotifier {
  final Playback player;

  late String _title;
  late String _artist;
  late Duration _duration;
  late double _progress;
  late bool _shuffle;
  late RepeatMode _repeatMode;

  String get title => _title;
  String get artist => _artist;
  Duration get duration => _duration;
  double get progress => _progress;
  bool get shuffle => _shuffle;
  RepeatMode get repeatMode => _repeatMode;

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

  PlaybackViewModel({required this.player});

  play() {
    player.play(
      PlayParams(filePath: 'filePath'),
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
