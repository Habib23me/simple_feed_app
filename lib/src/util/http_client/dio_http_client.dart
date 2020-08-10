import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';

import 'package:simple_feed/src/util/http_client/http_client.dart';
import 'package:simple_feed/src/util/log_handler/log_handler.dart';

class DioHttpClient implements HttpClient {
  static final authorizationKey = "Authorization";
  static final bearerPrefix = "Bearer";
  static const connectTimeout = 60000;
  static const receiveTimeout = 60000;

  final Dio _dio;
  final LogHandler _logHandler;

  DioHttpClient({
    @required String baseUrl,
    @required LogHandler logHandler,
    int connectTimeout = connectTimeout,
    int receiveTimeout = receiveTimeout,
  })  : assert(baseUrl != null),
        assert(logHandler != null),
        _logHandler = logHandler,
        _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: connectTimeout,
            responseType: ResponseType.json,
          ),
        ) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: onRequest,
      onResponse: onResponse,
      onError: onError,
    ));
  }

  @override
  void addAuthorizationHeader(String token) {
    _dio.options.headers[authorizationKey] = "$bearerPrefix $token";
  }

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    var response = await _dio.get<T>(
      path,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  @override
  Future<T> multiPartPost<T>(
    String path, {
    Map data,
    List files,
    String param = "image",
    ProgressCallback progressCallback,
    CancelToken cancelToken,
  }) async {
    var formData = FormData.fromMap(data ?? <String, dynamic>{});

    if (files != null && files.isNotEmpty) {
      for (var file in files) {
        var _file = await _parseFile(file);
        formData.files.add(MapEntry("$param", _file));
      }
    }
    return post<T>(
      path,
      data: formData,
      cancelToken: cancelToken,
      onSendProgress: progressCallback,
    );
  }

  @override
  Future<T> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) async {
    var response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  @override
  Future<T> put<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) async {
    var response = await _dio.put<T>(
      path,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  @override
  void removeAuthorizationHeader() {
    _dio.options.headers.remove(authorizationKey);
  }

  void onError(DioError e) {
    _logHandler.error({
      "path": "${e.request.baseUrl}${e.request.path}",
      "headers": e.request.headers,
      "sentData": _getRequestData(e.request),
      "sentQueryParams": e.request.queryParameters,
      "message": e.message,
      "statusCode": e.response?.statusCode,
      "statusMessage": e.response?.statusMessage,
      "data": e.response?.data,
    }, error: e);
  }

  RequestOptions onRequest(RequestOptions options) {
    _logHandler.verbose({
      "path": "${options.baseUrl}${options.path}",
      "headers": options.headers,
      "sentData": _getRequestData(options),
      "sentQueryParams": options.queryParameters
    });
    return options;
  }

  dynamic onResponse(Response response) {
    _logHandler.verbose({
      "path": "${response.request.baseUrl}${response.request.path}",
      "headers": response.request.headers,
      "sentData": _getRequestData(response.request),
      "sentQueryParams": response.request.queryParameters,
      "recieveStatusCode": response.statusCode,
      "recieveData": response.data,
    });
    return response.data;
  }

  static _getRequestData(RequestOptions request) {
    var data = request?.data;
    if (data is FormData) {
      data = data.fields;
    }
    return data;
  }

  Future<MultipartFile> _parseFile(image) async {
    var contentType = MediaType.parse("multipart/form-data");
    if (image is File) {
      return MultipartFile.fromFile(
        image.path,
        contentType: contentType,
      );
    } else if (image is List<int>) {
      return MultipartFile.fromBytes(
        image,
        contentType: contentType,
      );
    }
    return null;
  }
}
