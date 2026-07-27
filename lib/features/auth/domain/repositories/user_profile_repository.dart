import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/auth/domain/entities/user_profile.dart';

/// Persists the application profile that belongs to a Firebase Auth user.
abstract interface class UserProfileRepository {
  Future<Result<void>> upsert(UserProfile profile);
}
