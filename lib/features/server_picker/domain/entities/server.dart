import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';

@freezed
abstract class Server with _$Server {
  const factory Server({
    required String id,
    required String name,
    required String country,
    required int latencyMs,
    required bool isMine,
    required bool isFavorite,
    required String countryCode,
  }) = _Server;
}
