import 'package:dartz/dartz.dart';
import 'package:player_one/core/error/failure.dart';
import 'package:player_one/core/utils/params.dart';

abstract class UseCase<RT, P extends Params> {
  Future<Either<Failure, RT>> call(P params);
}