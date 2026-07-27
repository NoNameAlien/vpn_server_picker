import 'package:go_router/go_router.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/pages/server_picker_page.dart';

final appRouter = GoRouter(
  initialLocation: ServerPickerRouter.path,
  routes: [
    GoRoute(
      path: ServerPickerRouter.path,
      name: ServerPickerRouter.name,
      builder: (context, state) => const ServerPickerPage(),
    ),
  ],
);

abstract class ServerPickerRouter {
  static const path = '/';
  static const name = 'serverPicker';
}
