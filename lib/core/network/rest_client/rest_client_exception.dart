
import '../../core_exports.dart';

class RestClientException implements FailureNetwork {
  @override
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse? response;
  Object? errorType;
  String? path;

  RestClientException({
    this.message,
    this.statusCode,
    required this.error,
    this.response,
    this.errorType,
    this.path,
  });

  @override
  String toString() =>
      'RestClientException(message: $message, statusCode: $statusCode, error: $error, response: $response errorType: $errorType path: $path)';
}
