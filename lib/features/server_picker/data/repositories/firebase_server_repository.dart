import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vpn_server_picker/core/error/failure.dart';
import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/server_picker/data/datasources/server_remote_data_source.dart';
import 'package:vpn_server_picker/features/server_picker/domain/entities/server.dart';
import 'package:vpn_server_picker/features/server_picker/domain/repositories/server_repository.dart';

/// Converts Firestore catalog records into domain servers and Result failures.
class FirebaseServerRepository implements ServerRepository {
  FirebaseServerRepository(this._remoteDataSource);

  final ServerRemoteDataSource _remoteDataSource;

  /// Loads the active server catalog without leaking Firebase exceptions upward.
  @override
  Future<Result<List<Server>>> getServers() async {
    try {
      final servers = await _remoteDataSource.getActiveServers();
      final entities = servers
          .map((server) => server.toEntity())
          .toList(growable: false);

      return Success(entities);
    } on FirebaseException catch (error) {
      return FailureResult(ServerFailure(_messageForCode(error.code)));
    } on FormatException catch (error) {
      return FailureResult(ServerFailure(error.message));
    } catch (_) {
      return const FailureResult(
        ServerFailure('Не удалось загрузить список серверов'),
      );
    }
  }

  String _messageForCode(String code) {
    return switch (code) {
      'permission-denied' => 'Нет доступа к списку серверов',
      'unavailable' => 'Firestore временно недоступен. Проверьте интернет',
      'deadline-exceeded' => 'Загрузка серверов заняла слишком много времени',
      _ => 'Ошибка Firestore: $code',
    };
  }
}
