import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:your_gym_bro/core/logger/console_logger.dart';
import 'package:your_gym_bro/core/logger/core_logger.dart';
import 'package:your_gym_bro/core/logger/logger_enums.dart';

void main() {
  group('ConsoleLogger', () {
    late ConsoleLogger logger;
    late List<LogEvent> logEvents;

    setUp(() {
      logger = ConsoleLogger(className: 'TestClass');
      logEvents = [];
      logger.listenToLogs((event) {
        logEvents.add(event);
      });
    });

    test('logs info message', () async {
      final completer = Completer<LogEvent>();
      logger.listenToLogs((event) {
        if (event.message == 'Info message' && event.level == LogLevel.info) {
          completer.complete(event);
        }
      });
      logger.log('Info message', level: LogLevel.info);
      final event = await completer.future;
      expect(event.message, 'Info message');
      expect(event.level, LogLevel.info);
    });

    test('logs warning message', () async {
      final completer = Completer<LogEvent>();
      logger.listenToLogs((event) {
        if (event.message == 'Warning message' &&
            event.level == LogLevel.warning) {
          completer.complete(event);
        }
      });
      logger.log('Warning message', level: LogLevel.warning);
      final event = await completer.future;
      expect(event.message, 'Warning message');
      expect(event.level, LogLevel.warning);
    });

    test('logs error message', () async {
      final completer = Completer<LogEvent>();
      logger.listenToLogs((event) {
        if (event.message == 'Error message' &&
            event.level == LogLevel.error &&
            event.error != null) {
          completer.complete(event);
        }
      });
      logger.log(
        'Error message',
        level: LogLevel.error,
        error: Exception('Test error'),
      );
      final event = await completer.future;
      expect(event.message, 'Error message');
      expect(event.level, LogLevel.error);
      expect(event.error, isNotNull);
    });

    test('emits log events to stream', () async {
      final completer = Completer<LogEvent>();
      logger.listenToLogs((event) {
        if (event.message == 'Stream test') {
          completer.complete(event);
        }
      });
      logger.log('Stream test', level: LogLevel.info);
      final event = await completer.future;
      expect(event.message, 'Stream test');
    });

    tearDown(() {
      logger.dispose();
    });
  });
}
