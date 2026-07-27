import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/server_picker/data/datasources/server_remote_data_source.dart';
import 'package:vpn_server_picker/features/server_picker/data/dto/firestore_server_dto.dart';
import 'package:vpn_server_picker/features/server_picker/data/repositories/firebase_server_repository.dart';

void main() {
  group('FirebaseServerRepository', () {
    test('maps active Firestore records into domain servers', () async {
      final repository = FirebaseServerRepository(
        _FakeServerRemoteDataSource(
          servers: const [
            FirestoreServerDto(
            id: 'de-frankfurt-01',
            name: 'Frankfurt 01',
            country: 'Germany',
            countryCode: 'DE',
            isActive: true,
          ),
          ],
        ),
      );

      final result = await repository.getServers();

      expect(result, isA<Success>());
      final servers = (result as Success).data;
      expect(servers.single.id, 'de-frankfurt-01');
      expect(servers.single.latencyMs, -1);
      expect(servers.single.isFavorite, isFalse);
    });

    test('converts Firestore permission errors into a Result failure', () async {
      final repository = FirebaseServerRepository(
        _FakeServerRemoteDataSource(
          servers: const [],
          error: FirebaseException(
            plugin: 'cloud_firestore',
            code: 'permission-denied',
          ),
        ),
      );

      final result = await repository.getServers();

      expect(result, isA<FailureResult>());
      expect((result as FailureResult).error.message, 'Нет доступа к списку серверов');
    });
  });
}

class _FakeServerRemoteDataSource implements ServerRemoteDataSource {
  const _FakeServerRemoteDataSource({required this.servers, this.error});

  final List<FirestoreServerDto> servers;
  final Object? error;

  @override
  Future<List<FirestoreServerDto>> getActiveServers() async {
    if (error != null) throw error!;
    return servers;
  }
}
