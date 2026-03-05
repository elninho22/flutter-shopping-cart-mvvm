import 'dart:convert';
import 'package:dio/dio.dart';
import '../../core_exports.dart';

class LogsNetwork {
  LogsNetwork._();

  static void logsResponse(Response response) {
    final Map<String, dynamic> onResponse = {
      'METHOD': response.requestOptions.method,
      'PATH': response.requestOptions.path,
      'BASE_URL': response.requestOptions.baseUrl,
      'STATUS_CODE': response.statusCode,
      'STATUS_MESSAGE': response.statusMessage,
      'CONNECTIMEOUT': response.requestOptions.connectTimeout,
      'DATA': response.data != null && response.data.toString().length >= 50
          ? response.data.toString().substring(1, 50)
          : (response.data?.toString() ?? '---'),
    };
    DebugApp.http(
      label: '[Response]: ${response.requestOptions.path}',
      error: onResponse.toString(),
    );
  }

  static void logsRequest(RequestOptions options) {
    final dynamic formData = formatDataFields(options);
    final Map<String, dynamic> onRequest = {
      'METHOD': options.method,
      'PATH': options.path,
      'BASE_URL': options.baseUrl,
      'CONNECTIMEOUT': options.connectTimeout,
      'QUERY_PARAMETRES': options.queryParameters.toString(),
      'HEADERS': options.headers.toString(),
      'DATA': formData.toString(),
      'DATA MAP SIMPLES ': options.data.toString(),
    };

    DebugApp.http(
      label: '[Request]: ${options.path}',
      error: onRequest.toString(),
    );
  }

  static void logsError(DioException err) {
    final dynamic formData = formatDataFields(err.requestOptions);

    final Map<String, dynamic> onError = {
      'ErrorInterceptorHandler': 'Log direto do interceptor',
      'METHOD': err.requestOptions.method,
      'PATH': err.requestOptions.path,
      'BASE_URL': err.requestOptions.baseUrl,
      'STATUS_CODE': err.response?.statusCode,
      'STATUS_MESSAGE': err.response?.statusMessage,
      'CONNECTIMEOUT': err.requestOptions.connectTimeout,
      'QUERY_PARAMETRES': err.requestOptions.queryParameters.toString(),
      'HEADERS REQUEST': err.requestOptions.headers.toString(),
      'DATA REQUEST': formData.toString(),
      'DATA RESPONSE': err.response?.data.toString(),
      'HEADERS RESPONSE': err.response?.headers.toString(),
    };

    DebugApp.http(
      label: '[Error]: ${err.requestOptions.path}',
      error: onError.toString(),
    );
  }

  static dynamic formatDataFields(RequestOptions requestOptions) {
    if (requestOptions.method == 'GET') {
      return '';
    }

    final String data = requestOptions.data.toString();
    if (data != '' && data.isNotEmpty) {
      final json = jsonEncode(data);
      if (json.contains('FormData')) {
        return List<MapEntry<String, String>>.from(requestOptions.data.fields)
            .cast<MapEntry<String, String>>();
      }
    }
    return '';
  }
}
