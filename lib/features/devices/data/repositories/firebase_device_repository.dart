import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vpn_server_picker/core/error/failure.dart';
import 'package:vpn_server_picker/core/firebase/firestore_paths.dart';
import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/devices/domain/entities/device.dart';
import 'package:vpn_server_picker/features/devices/domain/repositories/device_repository.dart';

/// Registers a device in users/{uid}/devices/{deviceId}.
class FirebaseDeviceRepository implements DeviceRepository {
  FirebaseDeviceRepository(this._firestore);

  final FirebaseFirestore _firestore;

  /// Keeps createdAt on the first write and updates lastSeenAt on later launches.
  @override
  Future<Result<void>> register(Device device) async {
    try {
      final reference = _firestore.doc(
        FirestorePaths.userDevice(userId: device.userId, deviceId: device.id),
      );

      await _firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(reference);
        final data = <String, dynamic>{
          'name': device.name,
          'platform': device.platform.name,
          'lastSeenAt': FieldValue.serverTimestamp(),
        };

        if (!snapshot.exists) {
          data['createdAt'] = FieldValue.serverTimestamp();
        }

        transaction.set(reference, data, SetOptions(merge: true));
      });

      return const Success(null);
    } on FirebaseException catch (error) {
      return FailureResult(
        UnknownFailure('Не удалось зарегистрировать устройство: ${error.code}'),
      );
    } catch (_) {
      return const FailureResult(
        UnknownFailure('Не удалось зарегистрировать устройство'),
      );
    }
  }
}
