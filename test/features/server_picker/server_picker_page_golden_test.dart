import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_server_picker/core/theme/app_theme.dart';
import 'package:vpn_server_picker/features/server_picker/data/repositories/mock_server_repository.dart';
import 'package:vpn_server_picker/features/server_picker/domain/repositories/server_repository.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/pages/server_picker_page.dart';

void main() {
  Future<void> pumpServerPickerPage(
    WidgetTester tester, {
    required Size size,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      RepositoryProvider<ServerRepository>(
        create: (_) => const MockServerRepository(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark(),
          home: const ServerPickerPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('ServerPickerPage mobile golden', (tester) async {
    await pumpServerPickerPage(tester, size: Size(390, 844));
    await expectLater(
      find.byType(ServerPickerPage),
      matchesGoldenFile('goldens/server_picker_page_mobile.png'),
    );
  });

  testWidgets('ServerPickerPage tablet golden', (tester) async {
    await pumpServerPickerPage(tester, size: Size(768, 1024));
    await expectLater(
      find.byType(ServerPickerPage),
      matchesGoldenFile('goldens/server_picker_page_tablet.png'),
    );
  });

  testWidgets('ServerPickerPage desktop golden', (tester) async {
    await pumpServerPickerPage(tester, size: Size(1440, 900));
    await expectLater(
      find.byType(ServerPickerPage),
      matchesGoldenFile('goldens/server_picker_page_desktop.png'),
    );
  });
}
