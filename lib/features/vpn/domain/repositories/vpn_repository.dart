import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/vpn/domain/entities/vpn_config.dart';
import 'package:vpn_server_picker/features/vpn/domain/entities/vpn_connection_state.dart';

abstract interface class VpnRepository {
  Stream<VpnConnectionState> watchConnectionState();
  Future<Result<VpnConnectionState>> getCurrentState();
  Future<Result<void>> connect(VpnConfig config);
  Future<Result<void>> disconnect();
}
