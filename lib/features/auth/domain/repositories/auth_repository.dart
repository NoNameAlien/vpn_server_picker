import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/auth/domain/entities/user_profile.dart';

abstract interface class AuthRepository {
  Future<Result<UserProfile?>> getCurrentUser();

  /// Returns the current user or creates an anonymous session for Firestore.
  Future<Result<UserProfile>> ensureSignedIn();

  Future<Result<UserProfile>> signInAnonymously();

  Future<Result<void>> signOut();

  Stream<UserProfile?> watchAuthState();
}
