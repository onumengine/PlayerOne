import 'package:player_one/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/caching/domain/entities/cached.dart';
import 'package:player_one/features/caching/domain/repositories/cache_repository.dart';

class SaveState implements UseCase<CachedEntity, StateParams> {
  final CacheRepository repository;

  SaveState({required this.repository});

  @override
  Future<Either<Failure, CachedEntity>> call(StateParams params) async {
    return await repository.saveState(params.data);
  }
}

class StateParams extends Params {
  final dynamic data;

  StateParams({required this.data});

  @override
  List<Object?> get props => [data];
}
