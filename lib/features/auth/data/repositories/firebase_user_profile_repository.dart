import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vpn_server_picker/core/error/failure.dart';
import 'package:vpn_server_picker/core/firebase/firestore_paths.dart';
import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/auth/data/dto/user_profile_dto.dart';
import 'package:vpn_server_picker/features/auth/domain/entities/user_profile.dart';
import 'package:vpn_server_picker/features/auth/domain/repositories/user_profile_repository.dart';

/// Stores one application profile in users/{uid}.
class FirebaseUserProfileRepository implements UserProfileRepository {
  FirebaseUserProfileRepository(this._firestore);

  final FirebaseFirestore _firestore;

  /// Creates the document on first sign-in and refreshes its mutable fields later.
  @override
  Future<Result<void>> upsert(UserProfile profile) async {
    try {
      final dto = UserProfileDto.fromEntity(profile, updatedAt: DateTime.now());
      await _firestore
          .doc(FirestorePaths.user(profile.id))
          .set(dto.toFirestore(), SetOptions(merge: true));
      return const Success(null);
    } on FirebaseException catch (error) {
      return FailureResult(
        AuthFailure('Не удалось сохранить профиль: ${error.code}'),
      );
    } catch (_) {
      return const FailureResult(
        UnknownFailure('Не удалось сохранить профиль'),
      );
    }
  }
}
