import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final fontLoader = FontLoader('Roboto')
    ..addFont(_loadFont('test/assets/fonts/Roboto-Regular.ttf'))
    ..addFont(_loadFont('test/assets/fonts/Roboto-Medium.ttf'))
    ..addFont(_loadFont('test/assets/fonts/Roboto-Bold.ttf'));

  await fontLoader.load();
  await testMain();
}

Future<ByteData> _loadFont(String path) async {
  final bytes = await File(path).readAsBytes();
  return ByteData.sublistView(bytes);
}
