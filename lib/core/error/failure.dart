abstract class Failure {
  String get message;
}

class MusicFetchingFailure extends Failure {
  final String _description;

  MusicFetchingFailure({description}) : _description = description;

  @override
  String get message => _description;
}

class PlaybackFailure extends Failure {
  final String _description;

  PlaybackFailure({description}) : _description = description;

  @override
  String get message => _description;
}
