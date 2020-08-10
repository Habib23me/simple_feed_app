import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_feed/src/util/log_handler/log_handler.dart';

class DefaultBlocObserver extends BlocObserver {
  final LogHandler _logHandler;

  DefaultBlocObserver({@required LogHandler logHandler})
      : assert(logHandler != null),
        _logHandler = logHandler;

  @override
  void onChange(Cubit cubit, Change change) {
    _logHandler.verbose(change, tag: cubit.runtimeType);
    super.onChange(cubit, change);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    _logHandler.error(error, stackTrace: stackTrace, tag: cubit.runtimeType);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    _logHandler.verbose(event, tag: bloc.runtimeType);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logHandler.verbose(transition, tag: bloc.runtimeType);
    super.onTransition(bloc, transition);
  }
}
