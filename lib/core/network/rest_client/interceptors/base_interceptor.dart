
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core_library.dart';


class BaseInterceptor extends Interceptor {
  final RestClient _restClient;
  final LoggerApp _log;

  BaseInterceptor({
    required RestClient restClient,
    required LoggerApp log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    LogsNetwork.logsRequest(options);
    if (options.extra['auth_required'] == true) {
        handler.reject(
          DioException(
            requestOptions: options,
            error: 'Expire Token',
            type: DioExceptionType.cancel,
          ),
        );
    }
    if (!kReleaseMode) {
      _log.append('################## Request LOG ################ ');
      _log.append('url: ${options.uri}');
      _log.append('method: ${options.method}');
      _log.append('data: ${options.data}');
      _log.append('headers: ${options.headers}');
      _log.append('################## Request LOG ################ ');
      _log.closeAppend();
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogsNetwork.logsResponse(response);
    if (!kReleaseMode) {
      _log.append('################## Response LOG ################ ');
      _log.append('data: ${response.data}');
      _log.append('################## Response LOG ################ ');
      _log.closeAppend();
    }
    handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    _log.append('################## Error LOG ################ ');
    _log.append('Response error: ${err.response}');
    LogsNetwork.logsError(err);
    if (err.requestOptions.extra['auth_required'] == true) {
      final statusCode = err.response?.statusCode;
      if (statusCode == 403 || statusCode == 401) {
        return _retryRequest(err, handler);
      }
    }
    _log.append('################## Error LOG ################ ');
    _log.closeAppend();
    handler.next(err);
  }


  Future<void> _retryRequest(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      _log.info('################# Retry Request ##################');
      final requestOptions = err.requestOptions;

      final result = await _restClient.request(
        requestOptions.path,
        method: requestOptions.method,
        data: requestOptions.data,
        headers: requestOptions.headers,
        queryParameters: requestOptions.queryParameters,
      );

      handler.resolve(
        Response(
          requestOptions: requestOptions,
          data: result.data,
          statusCode: result.statusCode,
          statusMessage: result.statusMessage,
        ),
      );
    } on DioException catch (e, s) {
      _log.error('Erro ao refaz request', e, s);
      handler.reject(e);
    }
  }
}
