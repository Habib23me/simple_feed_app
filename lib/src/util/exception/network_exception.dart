import 'package:meta/meta.dart';

class NetworkException implements Exception {
  final String cause;
  final String message;

  NetworkException({@required this.message, this.cause});

  @override
  String toString() => 'NetworkException(cause: $cause, message: $message)';
}
