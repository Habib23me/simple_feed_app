import 'package:dio/dio.dart';

abstract class HttpClient {
  void addAuthorizationHeader(String token);
  void removeAuthorizationHeader();

  Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  });

  Future<T> put<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<T> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<T> multiPartPost<T>(
    String path, {
    Map data,
    List files,
    String param = "image",
    ProgressCallback progressCallback,
    CancelToken cancelToken,
  });
}
