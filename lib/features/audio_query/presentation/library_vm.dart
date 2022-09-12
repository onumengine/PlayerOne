import 'package:flutter/material.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/audio_query/domain/use_cases/get_tracks.dart';

class LibraryViewModel extends ChangeNotifier {
  final GetTracks getTracks;

  List<TrackEntity> _tracks = [];
  List<TrackEntity> get tracks => _tracks;

  LibraryState _state = LibraryState.unfetched;
  LibraryState get state => _state;

  LibraryViewModel({required this.getTracks}) {
    refreshLibrary();
  }

  refreshLibrary() async {
    final result = await getTracks(NoParams());
    result.fold((failure) {
      _state = LibraryState.unableToFetch;
      print(failure.message);
    }, (tracks) {
      _tracks = tracks;
      _state = LibraryState.fetched;
      notifyListeners();
    });
  }
}

enum LibraryState {
  unfetched,
  fetching,
  fetched,
  unableToFetch,
}
