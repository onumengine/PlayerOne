import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:player_one/features/caching/domain/entities/cached.dart';

class CachedModel extends CachedEntity {
  final dynamic data;

  const CachedModel({required this.data}) : super(data: data);

  factory CachedModel.fromJSON(dynamic data) {
    return CachedModel(data: jsonDecode(data));
  }

  @override
  List<Object?> get props => [data];
}
