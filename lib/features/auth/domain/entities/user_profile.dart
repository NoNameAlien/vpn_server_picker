import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    String? email,
    String? displayName,
    required bool isAnonymous,
    required DateTime createdAt,
  }) = _UserProfile;
}
