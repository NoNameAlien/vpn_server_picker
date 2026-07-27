import 'package:freezed_annotation/freezed_annotation.dart';

part 'vpn_config.freezed.dart';

enum VpnProtocol {
  wireGuard,
  openVpn,
  ikev2,
  unknown,
}

@freezed
abstract class VpnConfig with _$VpnConfig {
  const factory VpnConfig({
    required String id,
    required String userId,
    required String deviceId,
    required String serverId,
    required VpnProtocol protocol,
    required String endpoint,
    required DateTime issuedAt,
    DateTime? expiresAt,
  }) = _VpnConfig;
}
