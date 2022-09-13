import 'package:player_one/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/caching/domain/entities/cached.dart';
import 'package:player_one/features/caching/domain/repositories/cache_repository.dart';

class Fetch implements UseCase<CachedEntity, FetchParams> {
  final CacheRepository repository;

  Fetch({required this.repository});

  @override
  Future<Either<Failure, CachedEntity>> call(FetchParams params) async {
    return await repository.fetch(params.key);
  }
}

class FetchParams extends Params {
  final String key;

  FetchParams({required this.key});

  @override
  List<Object?> get props => [key];
}
