import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:core_cache/core_cache.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Cache cache;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    cache = await Cache.getInstance();
  });

  setUp(() async {
    await cache.clearAll();
  });

  test('returns the same singleton instance', () async {
    final secondInstance = await Cache.getInstance();

    expect(identical(cache, secondInstance), isTrue);
  });

  test('returns null for missing keys', () async {
    expect(await cache.getString('missing-string'), isNull);
    expect(await cache.getInt('missing-int'), isNull);
    expect(await cache.getDouble('missing-double'), isNull);
    expect(await cache.getBool('missing-bool'), isNull);
  });

  test('stores and retrieves all supported value types', () async {
    await cache.setString('name', 'core-cache');
    await cache.setInt('count', 42);
    await cache.setDouble('ratio', 3.14);
    await cache.setBool('enabled', true);

    expect(await cache.getString('name'), 'core-cache');
    expect(await cache.getInt('count'), 42);
    expect(await cache.getDouble('ratio'), 3.14);
    expect(await cache.getBool('enabled'), isTrue);
  });

  test('remove deletes only the targeted key', () async {
    await cache.setString('first', 'one');
    await cache.setString('second', 'two');

    await cache.remove('first');

    expect(await cache.getString('first'), isNull);
    expect(await cache.getString('second'), 'two');
  });

  test('clear removes only the targeted key', () async {
    await cache.setString('first', 'one');
    await cache.setString('second', 'two');

    await cache.clear('first');

    expect(await cache.getString('first'), isNull);
    expect(await cache.getString('second'), 'two');
  });

  test('clearAll removes all stored keys', () async {
    await cache.setString('name', 'to-clear');
    await cache.setInt('count', 1);

    await cache.clearAll();

    expect(await cache.getString('name'), isNull);
    expect(await cache.getInt('count'), isNull);
  });
}
