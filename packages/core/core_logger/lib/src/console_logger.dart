import 'dart:async';
import 'package:logging/logging.dart';
import 'core_logger.dart';
import 'logger_enums.dart';

class ConsoleLogger implements CoreLogger {
  ConsoleLogger({required String moduleName}) : _moduleName = moduleName;

  final String _moduleName;
  final Logger _logger = Logger('ConsoleLogger');

  final StreamController<LogEvent> _logController =
      StreamController.broadcast();

  @override
  String get className => _moduleName;

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
