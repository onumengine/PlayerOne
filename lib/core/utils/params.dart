import 'package:equatable/equatable.dart';

abstract class Params extends Equatable {
  @override
  List<Object?> get props => [];
}

class NoParams extends Params {}
