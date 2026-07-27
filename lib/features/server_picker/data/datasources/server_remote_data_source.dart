import 'package:vpn_server_picker/features/server_picker/data/dto/firestore_server_dto.dart';

/// Remote source of the shared VPN server catalog.
abstract interface class ServerRemoteDataSource {
  Future<List<FirestoreServerDto>> getActiveServers();
}
