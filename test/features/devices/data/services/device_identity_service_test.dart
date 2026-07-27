import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_server_picker/core/storage/local_storage.dart';
import 'package:vpn_server_picker/features/devices/data/services/device_identity_service.dart';

void main() {
  test('keeps one generated device id in local storage', () async {
    final storage = _MemoryLocalStorage();
    final service = DeviceIdentityService(storage);

    final first = await service.getCurrentDevice(userId: 'user-1');
    final second = await service.getCurrentDevice(userId: 'user-1');

    expect(first.id, second.id);
    expect(first.id, hasLength(32));
    expect(second.lastSeenAt, isNotNull);
  });
}

class _MemoryLocalStorage implements LocalStorage {
  final Map<String, Object> _values = {};

  @override
  Future<void> clear() async => _values.clear();

  @override
  Future<bool?> readBool(String key) async => _values[key] as bool?;

  @override
  Future<int?> readInt(String key) async => _values[key] as int?;

  @override
  Future<String?> readString(String key) async => _values[key] as String?;

  @override
  Future<void> remove(String key) async => _values.remove(key);

  @override
  Future<void> writeBool(String key, bool value) async {
    _values[key] = value;
  }

  @override
  Future<void> writeInt(String key, int value) async {
    _values[key] = value;
  }

  @override
  Future<void> writeString(String key, String value) async {
    _values[key] = value;
  }
}
