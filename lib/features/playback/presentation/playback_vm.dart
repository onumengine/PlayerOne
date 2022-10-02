import 'package:flutter/material.dart';
import 'package:player_one/core/utils/mock_data.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/caching/domain/use_cases/cache.dart';
import 'package:player_one/features/caching/domain/use_cases/save_state.dart';
import 'package:player_one/features/playback/domain/use_cases/play.dart';
import 'package:player_one/features/playback/domain/use_cases/playback.dart';

enum RepeatMode {
  off,
  single,
  all,
}

class PlaybackViewModel with ChangeNotifier {
  //Use cases erequired for the VM to perform playback
  final Playback player;
  final Cache cache;

  TrackEntity? _currentlyPlayingTrack;
  bool _trackIsLoaded = false;
  late Duration _duration;
  double _progress = nowPlayingState['progressPercent'];
  late bool _shuffle;
  late RepeatMode _repeatMode;
  bool _isPlaying = false;

  bool get trackIsLoaded => _trackIsLoaded;

  TrackEntity? get currentlyPlayingTrack => _currentlyPlayingTrack;

  Duration get duration => _duration;
  double get progress => _progress;
  bool get shuffle => _shuffle;
  RepeatMode get repeatMode => _repeatMode;
  bool get isPlaying => _isPlaying;

  setTrackIsLoaded(bool value) {
    _trackIsLoaded = value;
    notifyListeners();
  }

  setCurrentlyPlayingTrack(TrackEntity track) {
    _currentlyPlayingTrack = track;
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

  setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  PlaybackViewModel({required this.player, required this.cache}) {
    fetchPreviouslySavedState();
  }

  play(TrackEntity track) {
    setCurrentlyPlayingTrack(track);
    player.play(
      PlayParams(filePath: track.filePath),
    );
    setIsPlaying(true);
    setTrackIsLoaded(true);
    print('CURRENTLY PLAYING: ${track.title}');
  }

  pause() {
    player.pause(NoParams());
    setIsPlaying(false);
  }

  resume() {
    player.resume(NoParams());
    setIsPlaying(true);
  }

  stop() {
    player.stop(NoParams());
    setIsPlaying(false);
    setTrackIsLoaded(false);
  }

  Future fetchPreviouslySavedState() async {}

  dynamic _serializeState() {
    Map<String, dynamic> stateObject = {
      'title': _currentlyPlayingTrack?.title,
      'artist': _currentlyPlayingTrack?.artist,
      'duration': _duration,
      'progress': _progress,
      'shuffle': _shuffle,
      'repeatMode': _repeatMode,
      'trackIsLoaded': _trackIsLoaded,
    };
    return stateObject;
  }

  @override
  void dispose() async {
    var stateObject = _serializeState();
    final cachingResult = await cache.saveState(StateParams(data: stateObject));
    print('RESULT OF CACHING STATE: $cachingResult');
    super.dispose();
  }
}
