import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:simple_feed/src/util/bloc_observer/bloc_observer.dart';
import 'package:simple_feed/src/util/db/db_options/moor_db_options.dart';
import 'package:simple_feed/src/util/db/moor_db.dart';
import 'package:simple_feed/src/util/log_handler/development_log_handler.dart';
import 'package:simple_feed/src/util/log_handler/log_handler.dart';
import 'package:simple_feed/src/util/value_serializers/default_serializer.dart';

T getIt<T>() => GetIt.instance.get<T>();

class TestDependencyInjector {
  static registerDependencies() {
    //logger
    GetIt.instance.registerSingleton<LogHandler>(
      DevelopmentLogHandler(
        level: Level.verbose,
      ),
    );

    //Value Serializers
    GetIt.instance.registerSingleton<ValueSerializer>(
      DefaultValueSerializer(),
    );

    //db
    GetIt.instance.registerSingleton<MoorDatabase>(
      MoorDatabase(
        dbAccessor: MoorDatabaseSetupOptions.inMemoryExecuter,
        valueSerializer: getIt(),
      ),
    );

    //bloc observer
    Bloc.observer = DefaultBlocObserver(logHandler: getIt());
  }
}
