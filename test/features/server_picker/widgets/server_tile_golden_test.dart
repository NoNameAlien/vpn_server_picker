import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_server_picker/core/theme/app_colors.dart';
import 'package:vpn_server_picker/core/theme/app_theme.dart';
import 'package:vpn_server_picker/features/server_picker/data/mock_servers.dart';
import 'package:vpn_server_picker/features/server_picker/presentation/widgets/server_tile.dart';

void main() {
  Widget buildTestWidget(Widget child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(child: SizedBox(width: 360, child: child)),
      ),
    );
  }

  testWidgets('ServerTile normal golden', (tester) async {
    tester.view.physicalSize = const Size(400, 160);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      buildTestWidget(
        ServerTile(
          item: mockServers[1],
          selected: false,
          onTap: () {},
          onFavorite: () {},
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(ServerTile),
      matchesGoldenFile('../goldens/server_tile_normal.png'),
    );
  });

  testWidgets('ServerTile selected golden', (tester) async {
    tester.view.physicalSize = const Size(400, 160);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestWidget(
        ServerTile(
          item: mockServers[0],
          selected: true,
          onTap: () {},
          onFavorite: () {},
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(ServerTile),
      matchesGoldenFile('../goldens/server_tile_selected.png'),
    );
  });

  testWidgets('ServerTile favorite golden', (tester) async {
    tester.view.physicalSize = const Size(400, 160);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestWidget(
        ServerTile(
          item: mockServers[2],
          selected: false,
          onTap: () {},
          onFavorite: () {},
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(ServerTile),
      matchesGoldenFile('../goldens/server_tile_favorite.png'),
    );
  });

  testWidgets('ServerTile mine delete golden', (tester) async {
    tester.view.physicalSize = const Size(400, 160);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      buildTestWidget(
        ServerTile(
          item: mockServers[0],
          selected: false,
          onTap: () {},
          onFavorite: () {},
          trailingText: 'Удалить',
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(ServerTile),
      matchesGoldenFile('../goldens/server_tile_mine_delete.png'),
    );
  });
}
