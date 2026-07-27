import 'package:firebase_auth/firebase_auth.dart';
import 'package:vpn_server_picker/core/error/failure.dart';
import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/auth/domain/entities/user_profile.dart';
import 'package:vpn_server_picker/features/auth/domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<Result<UserProfile?>> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;

      return Success(user == null ? null : _mapUser(user));
    } on FirebaseAuthException catch (error) {
      return FailureResult(AuthFailure(_messageForCode(error.code)));
    } catch (_) {
      return FailureResult(UnknownFailure());
    }
  }

  @override
  Future<Result<UserProfile>> ensureSignedIn() async {
    final currentUserResult = await getCurrentUser();

    return currentUserResult.when(
      success: (user) => user == null
          ? signInAnonymously()
          : Future.value(Success(user)),
      failure: (failure) => Future.value(FailureResult(failure)),
    );
  }

  @override
  Future<Result<UserProfile>> signInAnonymously() async {
    try {
      final credential = await _firebaseAuth.signInAnonymously();
      final user = credential.user;

      if (user == null) {
        return const FailureResult(
          AuthFailure('Firebase не вернул пользователя'),
        );
      }

      return Success(_mapUser(user));
    } on FirebaseAuthException catch (error) {
      return FailureResult(AuthFailure(_messageForCode(error.code)));
    } catch (_) {
      return const FailureResult(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Success(null);
    } on FirebaseAuthException catch (error) {
      return FailureResult(AuthFailure(_messageForCode(error.code)));
    } catch (_) {
      return const FailureResult(UnknownFailure());
    }
  }

  @override
  Stream<UserProfile?> watchAuthState() {
    return _firebaseAuth.authStateChanges().map(
      (user) => user == null ? null : _mapUser(user),
    );
  }

  UserProfile _mapUser(User user) {
    return UserProfile(
      id: user.uid,
      isAnonymous: user.isAnonymous,
      email: user.email,
      displayName: user.displayName,
      createdAt:
          user.metadata.creationTime ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  String _messageForCode(String code) {
    return switch (code) {
      'operation-not-allowed' => 'Анонимная авторизация не включена в Firebase',
      'network-request-failed' => 'Не удалось подключиться к Firebase',
      'too-many-requests' => 'Слишком много попыток. Попробуйте позже',
      _ => 'Ошибка авторизации: $code',
    };
  }
}
