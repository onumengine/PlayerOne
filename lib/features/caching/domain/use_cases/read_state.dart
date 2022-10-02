import 'package:player_one/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/caching/domain/entities/cached.dart';
import 'package:player_one/features/caching/domain/repositories/cache_repository.dart';

class ReadState implements UseCase<CachedEntity, NoParams> {
  final CacheRepository repository;

  ReadState({required this.repository});

  @override
  Future<Either<Failure, CachedEntity>> call(NoParams params) async {
    return await repository.readState();
  }
}
