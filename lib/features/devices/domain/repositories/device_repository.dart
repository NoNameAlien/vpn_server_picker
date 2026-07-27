import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/devices/domain/entities/device.dart';

/// Persists devices owned by the current user.
abstract interface class DeviceRepository {
  Future<Result<void>> register(Device device);
}
