import 'package:vpn_server_picker/core/error/failure.dart';

sealed class Result<T> {
  const Result();
  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    return switch (this) {
      Success<T>(:final data) => success(data),
      FailureResult<T>(:final error) => failure(error),
    };
  }

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;
}

final class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

final class FailureResult<T> extends Result<T> {
  final Failure error;

  const FailureResult(this.error);
}
