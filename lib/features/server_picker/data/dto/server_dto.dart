import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vpn_server_picker/features/server_picker/domain/entities/server.dart';

part 'server_dto.freezed.dart';
part 'server_dto.g.dart';

@freezed
abstract class ServerDto with _$ServerDto {
  const ServerDto._();

  const factory ServerDto({
    required String id,
    required String name,
    required String country,
    required int latencyMs,
    required bool isMine,
    required bool isFavorite,
    required String countryCode,
  }) = _ServerDto;

  factory ServerDto.fromJson(Map<String, dynamic> json) =>
      _$ServerDtoFromJson(json);

  Server toEntity() {
    return Server(
      id: id,
      name: name,
      country: country,
      latencyMs: latencyMs,
      isMine: isMine,
      isFavorite: isFavorite,
      countryCode: countryCode,
    );
  }

  factory ServerDto.fromEntity(Server server) {
    return ServerDto(
      id: server.id,
      name: server.name,
      country: server.country,
      latencyMs: server.latencyMs,
      isMine: server.isMine,
      isFavorite: server.isFavorite,
      countryCode: server.countryCode,
    );
  }
}
