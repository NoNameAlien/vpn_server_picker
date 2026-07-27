/// Centralized Firestore collection paths.
///
/// Keeping paths here prevents small string mismatches between data sources.
abstract final class FirestorePaths {
  static const users = 'users';
  static const servers = 'servers';
  static const devices = 'devices';

  static String user(String userId) => '$users/$userId';

  static String userDevices(String userId) => '${user(userId)}/$devices';

  static String userDevice({required String userId, required String deviceId}) =>
      '${userDevices(userId)}/$deviceId';

  static String server(String serverId) => '$servers/$serverId';
}
