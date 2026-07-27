import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vpn_server_picker/features/auth/domain/entities/user_profile.dart';

/// Firestore representation of a user profile.
///
/// The document id is the Firebase Authentication uid, so it is not duplicated
/// in the stored fields.
class UserProfileDto {
  const UserProfileDto({
    required this.id,
    this.email,
    this.displayName,
    required this.isAnonymous,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfileDto.fromFirestore({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return UserProfileDto(
      id: id,
      email: data['email'] as String?,
      displayName: data['displayName'] as String?,
      isAnonymous: data['isAnonymous'] as bool? ?? true,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  final String id;
  final String? email;
  final String? displayName;
  final bool isAnonymous;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'isAnonymous': isAnonymous,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  UserProfile toEntity() {
    return UserProfile(
      id: id,
      email: email,
      displayName: displayName,
      isAnonymous: isAnonymous,
      createdAt: createdAt,
    );
  }

  factory UserProfileDto.fromEntity(
    UserProfile profile, {
    required DateTime updatedAt,
  }) {
    return UserProfileDto(
      id: profile.id,
      email: profile.email,
      displayName: profile.displayName,
      isAnonymous: profile.isAnonymous,
      createdAt: profile.createdAt,
      updatedAt: updatedAt,
    );
  }
}
