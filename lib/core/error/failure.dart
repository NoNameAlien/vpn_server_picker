import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

final class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

final class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unknown error occurred']);
}

final class AuthFailure extends Failure {
  const AuthFailure(super.message);
}
