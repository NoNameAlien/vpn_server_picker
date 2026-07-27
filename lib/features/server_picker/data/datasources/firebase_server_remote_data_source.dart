import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vpn_server_picker/core/firebase/firestore_paths.dart';
import 'package:vpn_server_picker/features/server_picker/data/datasources/server_remote_data_source.dart';
import 'package:vpn_server_picker/features/server_picker/data/dto/firestore_server_dto.dart';

/// Firestore implementation that reads only active catalog servers.
class FirebaseServerRemoteDataSource implements ServerRemoteDataSource {
  FirebaseServerRemoteDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<List<FirestoreServerDto>> getActiveServers() async {
    final snapshot = await _firestore
        .collection(FirestorePaths.servers)
        .where('isActive', isEqualTo: true)
        .get();

    return snapshot.docs
        .map(
          (document) => FirestoreServerDto.fromFirestore(
            id: document.id,
            data: document.data(),
          ),
        )
        .toList(growable: false);
  }
}
