import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

enum DevicePlatform {
  android,
  ios,
  macos,
  windows,
  linux,
  web,
  unknown,
}

@freezed
abstract class Device with _$Device {
  const factory Device({
    required String id,
    required String userId,
    required String name,
    required DevicePlatform platform,
    required DateTime createdAt,
    DateTime? lastSeenAt,
  }) = _Device;
}
