abstract class LogHandler {
  void verbose(dynamic message, {tag});

  void info(dynamic message, {tag});

  void transition(dynamic message, {tag});

  void warning(dynamic message, {tag});

  void error(message, {error, StackTrace stackTrace, tag});

  void wtf(dynamic message, {tag});
}
