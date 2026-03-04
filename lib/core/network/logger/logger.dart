// ignore_for_file: type_annotate_public_apis

import 'dart:developer' as lg;

import 'package:logger/logger.dart' as log;

abstract class LoggerApp {
  void debug(String message, [dynamic error, StackTrace? stackTrace]);
  void info(String message, [dynamic error, StackTrace? stackTrace]);
  void warning(String message, [dynamic error, StackTrace? stackTrace]);
  void error(String message, [dynamic error, StackTrace? stackTrace]);
  void append(String message);
  void closeAppend();
}

class LoggerImpl implements LoggerApp {
  List<String> messages = [];

  final logger = log.Logger();

  @override
  void debug(String message, [error, StackTrace? stackTrace]) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(String message, [error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message, [error, StackTrace? stackTrace]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(String message, [error, StackTrace? stackTrace]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void append(String message) {
    messages.add(message);
  }

  @override
  void closeAppend() {
    lg.log(messages.join('\n'));
    messages = [];
  }
}
