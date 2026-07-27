import 'package:vpn_server_picker/features/server_picker/domain/entities/server.dart';

/// Raw server-catalog data stored in Firestore.
///
/// User preferences and measured latency intentionally do not belong here:
/// they vary per user or per device, while this document is shared by everyone.
class FirestoreServerDto {
  const FirestoreServerDto({
    required this.id,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.isActive,
  });

  /// Creates a DTO from a Firestore document id and its stored fields.
  factory FirestoreServerDto.fromFirestore({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return FirestoreServerDto(
      id: id,
      name: _requiredString(data, 'name'),
      country: _requiredString(data, 'country'),
      countryCode: _requiredString(data, 'countryCode'),
      isActive: _requiredBool(data, 'isActive'),
    );
  }

  final String id;
  final String name;
  final String country;
  final String countryCode;
  final bool isActive;

  /// Adapts the shared catalog record to the current server-picker UI model.
  Server toEntity() {
    return Server(
      id: id,
      name: name,
      country: country,
      countryCode: countryCode,
      latencyMs: -1,
      isMine: false,
      isFavorite: false,
    );
  }

  static String _requiredString(Map<String, dynamic> data, String key) {
    final value = data[key];
    if (value is String && value.trim().isNotEmpty) return value;
    throw FormatException('Поле "$key" сервера должно быть непустой строкой');
  }

  static bool _requiredBool(Map<String, dynamic> data, String key) {
    final value = data[key];
    if (value is bool) return value;
    throw FormatException('Поле "$key" сервера должно быть bool');
  }
}
