import 'package:flutter_test/flutter_test.dart';
import 'package:vpn_server_picker/core/app/app.dart';

void main() {
  testWidgets('show server picker title', (tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Точки доступа'), findsOneWidget);
    expect(find.text('Все'), findsOneWidget);
    expect(find.text('Мои'), findsOneWidget);
    expect(find.text('Избранные'), findsOneWidget);
  });
}
