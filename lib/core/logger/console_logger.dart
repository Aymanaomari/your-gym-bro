import 'dart:async';
import 'package:logging/logging.dart';
import 'package:your_gym_bro/core/logger/core_logger.dart';
import 'package:your_gym_bro/core/logger/logger_enums.dart';

class LoggerBootstrap {
  LoggerBootstrap._();

  static const String _reset = '\x1B[0m';
  static const String _grey = '\x1B[90m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _red = '\x1B[31m';

  static bool _isInitialized = false;

  static void initialize({Level level = Level.ALL}) {
    if (_isInitialized) {
      return;
    }

    Logger.root.level = level;
    Logger.root.onRecord.listen((record) {
      final color = _colorForLevel(record.level);
      print(
        '$color${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}$_reset',
      );
    });

    _isInitialized = true;
  }

  static String _colorForLevel(Level level) {
    if (level >= Level.SEVERE) {
      return _red;
    }
    if (level >= Level.WARNING) {
      return _yellow;
    }
    if (level >= Level.INFO) {
      return _green;
    }
    return _grey;
  }
}

class ConsoleLogger implements CoreLogger {
  ConsoleLogger({required String className})
    : _className = className,
      _logger = Logger(className) {
    LoggerBootstrap.initialize();
  }

  final String _className;
  final Logger _logger;

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
    _logger.log(_mapLogLevel(level), '$message', error, stackTrace);
    if (error != null) {
      _logger.severe('$error');
    }
    if (stackTrace != null) {
      _logger.severe('$stackTrace');
    }
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
