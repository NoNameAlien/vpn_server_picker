import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/server_picker/data/mock_servers.dart';
import 'package:vpn_server_picker/features/server_picker/domain/entities/server.dart';
import 'package:vpn_server_picker/features/server_picker/domain/repositories/server_repository.dart';

class MockServerRepository implements ServerRepository {
  const MockServerRepository();

  @override
  Future<Result<List<Server>>> getServers() async {
    return Success(mockServers);
  }
}
