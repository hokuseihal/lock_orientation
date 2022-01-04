import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lock_orientation/lock_orientation.dart';

void main() {
  const MethodChannel channel = MethodChannel('lock_orientation');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await LockOrientation.platformVersion, '42');
  });
}
