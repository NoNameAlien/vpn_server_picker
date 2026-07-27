import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vpn_server_picker/features/devices/domain/entities/device.dart';

/// Firestore representation of a user's device.
///
/// The user id belongs to the document path: users/{userId}/devices/{deviceId}.
class DeviceDto {
  const DeviceDto({
    required this.id,
    required this.name,
    required this.platform,
    required this.createdAt,
    this.lastSeenAt,
  });

  factory DeviceDto.fromFirestore({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return DeviceDto(
      id: id,
      name: data['name'] as String? ?? 'Unknown device',
      platform: _platformFromName(data['platform'] as String?),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ??
          DateTime.fromMillisecondsSinceEpoch(0),
      lastSeenAt: (data['lastSeenAt'] as Timestamp?)?.toDate(),
    );
  }

  final String id;
  final String name;
  final DevicePlatform platform;
  final DateTime createdAt;
  final DateTime? lastSeenAt;

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'platform': platform.name,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastSeenAt': lastSeenAt == null ? null : Timestamp.fromDate(lastSeenAt!),
    };
  }

  Device toEntity({required String userId}) {
    return Device(
      id: id,
      userId: userId,
      name: name,
      platform: platform,
      createdAt: createdAt,
      lastSeenAt: lastSeenAt,
    );
  }

  factory DeviceDto.fromEntity(Device device) {
    return DeviceDto(
      id: device.id,
      name: device.name,
      platform: device.platform,
      createdAt: device.createdAt,
      lastSeenAt: device.lastSeenAt,
    );
  }

  static DevicePlatform _platformFromName(String? value) {
    for (final platform in DevicePlatform.values) {
      if (platform.name == value) return platform;
    }
    return DevicePlatform.unknown;
  }
}
