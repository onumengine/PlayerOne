import 'package:equatable/equatable.dart';

class CachedEntity extends Equatable {
  final dynamic data;

  const CachedEntity({required this.data});

  @override
  List<Object?> get props => [data];
}
