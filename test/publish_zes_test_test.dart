import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:publish_zes_test/publish_zes_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('publish_zes_test');

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
    expect(await PublishZesTest.platformVersion, '42');
  });
}
