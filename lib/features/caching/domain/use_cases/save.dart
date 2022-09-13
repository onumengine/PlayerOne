import 'package:player_one/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:player_one/core/utils/params.dart';
import 'package:player_one/core/utils/use_case.dart';
import 'package:player_one/features/caching/domain/entities/cached.dart';
import 'package:player_one/features/caching/domain/repositories/cache_repository.dart';

class Save implements UseCase<CachedEntity, CacheParams> {
  final CacheRepository repository;

  Save({required this.repository});

  @override
  Future<Either<Failure, CachedEntity>> call(CacheParams params) async {
    return await repository.save(params.key, params.value);
  }
}

class CacheParams extends Params {
  final String key;
  final String value;

  CacheParams({required this.key, required this.value});

  @override
  List<Object?> get props => [key, value];
}
