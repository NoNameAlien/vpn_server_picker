import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_server_picker/core/storage/local_storage.dart';

/// LocalStorage implementation backed by SharedPreferences.
class SharedPreferencesLocalStorage implements LocalStorage {
  SharedPreferencesLocalStorage(this._preferences);

  /// Creates storage after the platform preferences are available.
  static Future<SharedPreferencesLocalStorage> create() async {
    final preferences = await SharedPreferences.getInstance();
    return SharedPreferencesLocalStorage(preferences);
  }

  final SharedPreferences _preferences;

  @override
  Future<String?> readString(String key) async => _preferences.getString(key);

  @override
  Future<void> writeString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  @override
  Future<bool?> readBool(String key) async => _preferences.getBool(key);

  @override
  Future<void> writeBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  @override
  Future<int?> readInt(String key) async => _preferences.getInt(key);

  @override
  Future<void> writeInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _preferences.clear();
  }
}
