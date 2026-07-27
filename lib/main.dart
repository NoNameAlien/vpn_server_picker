import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vpn_server_picker/core/app/app.dart';
import 'package:vpn_server_picker/core/storage/shared_preferences_local_storage.dart';
import 'package:vpn_server_picker/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:vpn_server_picker/features/auth/data/repositories/firebase_user_profile_repository.dart';
import 'package:vpn_server_picker/features/devices/data/repositories/firebase_device_repository.dart';
import 'package:vpn_server_picker/features/devices/data/services/device_identity_service.dart';
import 'package:vpn_server_picker/features/server_picker/data/datasources/firebase_server_remote_data_source.dart';
import 'package:vpn_server_picker/features/server_picker/data/repositories/firebase_server_repository.dart';
import 'package:vpn_server_picker/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authRepository = FirebaseAuthRepository(FirebaseAuth.instance);
  final firestore = FirebaseFirestore.instance;

  // Firestore rules require an authenticated user, including anonymous users.
  final authResult = await authRepository.ensureSignedIn();
  await authResult.when<Future<void>>(
    success: (profile) async {
      final profileRepository = FirebaseUserProfileRepository(firestore);
      final deviceRepository = FirebaseDeviceRepository(firestore);
      final localStorage = await SharedPreferencesLocalStorage.create();
      final deviceIdentityService = DeviceIdentityService(localStorage);

      final profileResult = await profileRepository.upsert(profile);
      await profileResult.when<Future<void>>(
        success: (_) async {
          final device = await deviceIdentityService.getCurrentDevice(
            userId: profile.id,
          );
          final deviceResult = await deviceRepository.register(device);
          deviceResult.when(
            success: (_) {},
            failure: (failure) {
              debugPrint('Device registration failed: ${failure.message}');
            },
          );
        },
        failure: (failure) async {
          debugPrint('Profile synchronization failed: ${failure.message}');
        },
      );
    },
    failure: (failure) async {
      debugPrint('Firebase authentication failed: ${failure.message}');
    },
  );

  runApp(
    App(
      authRepository: authRepository,
      serverRepository: FirebaseServerRepository(
        FirebaseServerRemoteDataSource(firestore),
      ),
    ),
  );
}
