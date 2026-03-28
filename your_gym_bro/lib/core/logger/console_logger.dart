import 'dart:async';
import 'package:logging/logging.dart';
import 'package:your_gym_bro/core/logger/core_logger.dart';
import 'package:your_gym_bro/core/logger/logger_enums.dart';

class ConsoleLogger implements CoreLogger {
  ConsoleLogger({required String className}) : _className = className;

  final String _className;
  final Logger _logger = Logger('ConsoleLogger');

  final StreamController<LogEvent> _logController =
      StreamController.broadcast();

  @override
  String get className => _className;

  @override
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Log to console
    _logger.log(
      _mapLogLevel(level),
      '[${level.name.toUpperCase()}][$className] $message',
      error,
      stackTrace,
    );
    if (error != null) {
      _logger.severe('Error: $error');
    }
    if (stackTrace != null) {
      _logger.severe('StackTrace: $stackTrace');
    }
    // Emit log event
    _logController.add(
      LogEvent(
        message: message,
        level: level,
        error: error,
        stackTrace: stackTrace,
        className: className,
      ),
    );
  }

  @override
  void listenToLogs(void Function(LogEvent) onLog) {
    _logController.stream.listen((event) {
      onLog(event);
    });
  }

  // Optionally, close the stream when done
  void dispose() {
    _logController.close();
  }

  Level _mapLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return Level.FINE;
      case LogLevel.info:
        return Level.INFO;
      case LogLevel.warning:
        return Level.WARNING;
      case LogLevel.error:
        return Level.SEVERE;
    }
  }
}
