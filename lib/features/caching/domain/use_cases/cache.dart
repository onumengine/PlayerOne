import 'package:player_one/features/caching/domain/use_cases/fetch.dart';
import 'package:player_one/features/caching/domain/use_cases/save.dart';
import 'package:player_one/features/caching/domain/use_cases/save_state.dart';

class Cache {
  final Save save;
  final Fetch fetch;
  final SaveState saveState;

  Cache({
    required this.save,
    required this.fetch,
    required this.saveState,
  });
}
