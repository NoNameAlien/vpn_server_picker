import 'package:freezed_annotation/freezed_annotation.dart';

part 'vpn_connection_state.freezed.dart';

@freezed
sealed class VpnConnectionState with _$VpnConnectionState {
  const factory VpnConnectionState.disconnected() = VpnDisconnected;

  const factory VpnConnectionState.connecting({required String serverId}) =
      VpnConnecting;

  const factory VpnConnectionState.connected({
    required String serverId,
    required DateTime connectedAt,
  }) = VpnConnected;

  const factory VpnConnectionState.disconnecting({required String serverId}) =
      VpnDisconnecting;

  const factory VpnConnectionState.failure({required String message}) =
      VpnConnectionFailure;
}
