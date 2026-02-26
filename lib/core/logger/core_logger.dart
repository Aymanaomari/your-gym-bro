import 'package:your_gym_bro/core/logger/logger_enums.dart';

class LogEvent {
  final String message;
  final LogLevel level;
  final Object? error;
  final StackTrace? stackTrace;
  final String className;

  LogEvent({
    required this.message,
    required this.level,
    this.error,
    this.stackTrace,
    required this.className,
  });
}

abstract interface class CoreLogger {
  CoreLogger();

  String get className;

  void log(
    String message, {
    LogLevel level = LogLevel.info,
    Object? error,
    StackTrace? stackTrace,
  });
}
