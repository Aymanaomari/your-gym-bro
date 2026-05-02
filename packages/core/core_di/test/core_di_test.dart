import 'package:core_di/core_di.dart';
import 'package:test/test.dart';

int _counter = 0;

String _nextName(String prefix) {
  _counter++;
  return '$prefix-$_counter';
}

void main() {
  group('CoreDI public API', () {
    late CoreDIBase di;

    setUp(() {
      di = CoreDIResolver.getInstance();
    });

    test('resolver returns a singleton as interface', () {
      final first = CoreDIResolver.getInstance();
      final second = CoreDIResolver.getInstance();

      expect(identical(first, second), isTrue);
    });

    test('register + resolve with instance name', () {
      final name = _nextName('apiBaseUrl');
      di.register<String>('main-api', instanceName: name);

      expect(di.resolve<String>(instanceName: name), equals('main-api'));
      expect(di.isRegistered<String>(instanceName: name), isTrue);
    });

    test('tryResolve returns null for missing registrations', () {
      expect(di.tryResolve<int>(), isNull);
    });

    test('factory resolves a new instance each call', () {
      final name = _nextName('factory-int');
      var factoryCounter = 0;
      di.registerFactory<int>(() {
        factoryCounter++;
        return 42;
      }, instanceName: name);

      expect(di.resolve<int>(instanceName: name), equals(42));
      expect(di.resolve<int>(instanceName: name), equals(42));
      expect(factoryCounter, equals(2));
    });

    test('lazy singleton resolves same instance', () {
      final name = _nextName('lazy-status');
      var lazyCounter = 0;
      di.registerLazySingleton<String>(() {
        lazyCounter++;
        return 'ready';
      }, instanceName: name);

      expect(di.resolve<String>(instanceName: name), equals('ready'));
      expect(di.resolve<String>(instanceName: name), equals('ready'));
      expect(lazyCounter, equals(1));
    });

    test('unregister removes registration', () {
      final name = _nextName('bool-singleton');
      di.registerSingleton<bool>(true, instanceName: name);
      expect(di.isRegistered<bool>(instanceName: name), isTrue);

      di.unregister<bool>(instanceName: name);
      expect(di.isRegistered<bool>(instanceName: name), isFalse);
    });

    test('reset clears all registrations', () async {
      final doubleName = _nextName('double-singleton');
      final stringName = _nextName('string-singleton');
      di.register<double>(1.0, instanceName: doubleName);
      di.register<String>('v1', instanceName: stringName);

      di.reset();
      await Future<void>.delayed(Duration.zero);

      expect(di.isRegistered<double>(instanceName: doubleName), isFalse);
      expect(di.isRegistered<String>(instanceName: stringName), isFalse);
    });
  });
}
