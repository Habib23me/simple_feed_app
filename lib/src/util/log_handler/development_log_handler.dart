import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import 'log_handler.dart';

class DevelopmentLogHandler extends LogHandler {
  final Logger _logger;

  DevelopmentLogHandler({@required Level level})
      : assert(level != null),
        _logger = Logger(
          filter: DevelopmentFilter(),
          level: level,
          printer: PrettyPrinter(
            printEmojis: true,
            printTime: false,
            colors: true,
            methodCount: 0,
            errorMethodCount: 15,
          ),
        );

  @override
  void error(message, {error, StackTrace stackTrace, tag}) =>
      _logger.e(_parseMessage(message, tag), error, stackTrace);

  @override
  void info(message, {tag}) => _logger.i(_parseMessage(message, tag));

  @override
  void transition(dynamic message, {tag}) =>
      _logger.i(_parseMessage(message, tag));

  @override
  void verbose(dynamic message, {tag}) =>
      _logger.v(_parseMessage(message, tag));

  @override
  void warning(dynamic message, {tag}) =>
      _logger.w(_parseMessage(message, tag));

  @override
  void wtf(dynamic message, {tag}) => _logger.wtf(_parseMessage(message, tag));

  // TODO handle adding new line breaks for objects
  static _parseMessage(message, tag) {
    if (tag != null) {
      return {"$tag": "$message"};
    }
    return "$message";
  }
}
