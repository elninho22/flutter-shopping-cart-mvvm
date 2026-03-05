

import '../../core_exports.dart';

class ExceptionGeneric implements FailureNetwork {
  @override
  final String message;
  final int statusCode;
  final String? path;
  final dynamic error;

  ExceptionGeneric({
    required this.message,
    this.path,
    this.statusCode = 1001,
    this.error = '',
  });

  @override
  String toString() => '''
              ExceptionGeneric:
              path: $path 
              message: $message 
              statusCode: $statusCode
              error: $error
            ''';
}
