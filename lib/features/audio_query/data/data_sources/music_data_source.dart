import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:player_one/features/audio_query/data/models/track.dart';

abstract class LocalMusicDataSource {
  Future<List<TrackModel>> fetchSongs();
}

class DeviceContentProvider implements LocalMusicDataSource {
  final FlutterAudioQuery flutterAudioQuery;

  DeviceContentProvider({required this.flutterAudioQuery});

  @override
  Future<List<TrackModel>> fetchSongs() async {
    final response = await flutterAudioQuery.getSongs();
    print('SONGS RESPONSE IN FLUTTER AUDIO QUERY IS: $response');
    print('SONGS RESPONSE LENGTH: ${response.length}');
    final musicList = _filterAndReturnOnlyMusic(response);
    print('MUSIC LIST AFTER FILTERING IS: $musicList');
    print('MUSIC LIST LENGTH: ${musicList.length}');
    final trackList = musicList
        .map<TrackModel>((songInfo) => TrackModel.fromSongInfo(songInfo))
        .toList();
    return trackList;
  }

  List<SongInfo> _filterAndReturnOnlyMusic(List<SongInfo> allAudio) {
    final music = allAudio.takeWhile((audio) => audio.isMusic).toList();
    return music;
  }
}
