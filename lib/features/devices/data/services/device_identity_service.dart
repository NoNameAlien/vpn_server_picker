import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:vpn_server_picker/core/storage/local_storage.dart';
import 'package:vpn_server_picker/features/devices/domain/entities/device.dart';

/// Creates one random device id and keeps it stable in local storage.
class DeviceIdentityService {
  DeviceIdentityService(this._storage);

  static const _deviceIdKey = 'device_id';

  final LocalStorage _storage;

  /// Returns the same device id on every launch until application data is cleared.
  Future<Device> getCurrentDevice({required String userId}) async {
    var deviceId = await _storage.readString(_deviceIdKey);
    deviceId ??= _generateDeviceId();
    await _storage.writeString(_deviceIdKey, deviceId);

    final platform = _currentPlatform();
    final now = DateTime.now();
    return Device(
      id: deviceId,
      userId: userId,
      name: '${platform.name} device',
      platform: platform,
      createdAt: now,
      lastSeenAt: now,
    );
  }

  DevicePlatform _currentPlatform() {
    if (kIsWeb) return DevicePlatform.web;

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => DevicePlatform.android,
      TargetPlatform.iOS => DevicePlatform.ios,
      TargetPlatform.macOS => DevicePlatform.macos,
      TargetPlatform.windows => DevicePlatform.windows,
      TargetPlatform.linux => DevicePlatform.linux,
      TargetPlatform.fuchsia => DevicePlatform.unknown,
    };
  }

  String _generateDeviceId() {
    final random = Random.secure();
    final values = List<int>.generate(16, (_) => random.nextInt(256));
    return values
        .map((value) => value.toRadixString(16).padLeft(2, '0'))
        .join();
  }
}
