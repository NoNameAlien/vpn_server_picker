import 'package:vpn_server_picker/core/result/results.dart';
import 'package:vpn_server_picker/features/server_picker/domain/entities/server.dart';

abstract interface class ServerRepository {
  Future<Result<List<Server>>> getServers();
}
