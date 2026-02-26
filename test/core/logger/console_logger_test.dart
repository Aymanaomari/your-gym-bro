import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:your_gym_bro/app/app_providers.dart';
import 'package:your_gym_bro/core/logger/core_logger.dart';
import 'package:your_gym_bro/core/logger/logger_enums.dart';

void main() {
  group('ConsoleLogger', () {
    late ProviderContainer container;
    late CoreLogger logger;

    setUp(() {
      container = ProviderContainer();
      logger = container.read(loggerProvider('TestClass'));
      addTearDown(container.dispose);
      Logger.root.level = Level.ALL;
    });

    test('logs info message', () async {
      final recordFuture = Logger.root.onRecord.firstWhere(
        (record) =>
            record.loggerName == 'TestClass' &&
            record.message.contains('Info message'),
      );

      logger.log('Info message', level: LogLevel.info);

      final record = await recordFuture.timeout(const Duration(seconds: 1));
      expect(record.level, Level.INFO);
      expect(record.message, contains('Info message'));
    });

    test('logs warning message', () async {
      final recordFuture = Logger.root.onRecord.firstWhere(
        (record) =>
            record.loggerName == 'TestClass' &&
            record.message.contains('Warning message'),
      );

      logger.log('Warning message', level: LogLevel.warning);

      final record = await recordFuture.timeout(const Duration(seconds: 1));
      expect(record.level, Level.WARNING);
      expect(record.message, contains('Warning message'));
    });

    test('logs error message', () async {
      final exception = Exception('Test error');
      final recordFuture = Logger.root.onRecord.firstWhere(
        (record) =>
            record.loggerName == 'TestClass' &&
            record.message.contains('Error message'),
      );

      logger.log('Error message', level: LogLevel.error, error: exception);

      final record = await recordFuture.timeout(const Duration(seconds: 1));
      expect(record.level, Level.SEVERE);
      expect(record.message, contains('Error message'));
      expect(record.error, same(exception));
    });

    test('exposes className', () {
      expect(logger.className, 'TestClass');
    });
  });
}
