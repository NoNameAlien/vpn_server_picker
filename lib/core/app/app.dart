import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_server_picker/core/router/app_router.dart';
import 'package:vpn_server_picker/core/theme/app_theme.dart';
import 'package:vpn_server_picker/features/auth/domain/repositories/auth_repository.dart';
import 'package:vpn_server_picker/features/server_picker/data/repositories/mock_server_repository.dart';
import 'package:vpn_server_picker/features/server_picker/domain/repositories/server_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.authRepository,
    this.serverRepository,
  });

  final AuthRepository? authRepository;
  final ServerRepository? serverRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        if (serverRepository == null)
          RepositoryProvider<ServerRepository>(
            create: (_) => const MockServerRepository(),
          )
        else
          RepositoryProvider<ServerRepository>.value(value: serverRepository!),
        if (authRepository != null)
          RepositoryProvider<AuthRepository>.value(value: authRepository!),
      ],
      child: MaterialApp.router(
        title: 'VPN Server Picker',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark(),
        routerConfig: appRouter,
      ),
    );
  }
}
