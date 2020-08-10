import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:simple_feed/src/data/auth/bloc/auth_bloc.dart';
import 'package:simple_feed/src/data/auth/repository/account/account_repository.dart';
import 'package:simple_feed/src/data/auth/repository/account/firebase_account_repository.dart';
import 'package:simple_feed/src/data/auth/repository/auth/auth_api_repository.dart';
import 'package:simple_feed/src/data/auth/repository/auth/auth_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/firebase_phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/util/account_data_subscription.dart';
import 'package:simple_feed/src/data/post/dao/moor_post_dao.dart';
import 'package:simple_feed/src/data/post/dao/post_dao.dart';
import 'package:simple_feed/src/data/post/repository/feed/feed_api_repository.dart';
import 'package:simple_feed/src/data/post/repository/feed/feed_repository.dart';
import 'package:simple_feed/src/util/bloc_observer/bloc_observer.dart';
import 'package:simple_feed/src/util/db/db_options/moor_db_options.dart';
import 'package:simple_feed/src/util/db/moor_db.dart';
import 'package:simple_feed/src/util/http_client/dio_http_client.dart';
import 'package:simple_feed/src/util/http_client/http_client.dart';
import 'package:simple_feed/src/util/log_handler/development_log_handler.dart';
import 'package:simple_feed/src/util/log_handler/log_handler.dart';
import 'package:simple_feed/src/util/value_serializers/default_serializer.dart';

import 'app_constants.dart';

T getIt<T>() => GetIt.instance.get<T>();

class DependencyInjector {
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
    //httpClient
    GetIt.instance.registerSingleton<HttpClient>(
      DioHttpClient(
        baseUrl: AppConstants.testBaseUrl,
        logHandler: getIt(),
      ),
    );

    //db
    GetIt.instance.registerSingleton<MoorDatabase>(
      MoorDatabase(
        dbAccessor: MoorDatabaseSetupOptions.inMemoryExecuter,
        valueSerializer: getIt(),
      ),
    );

    //Daos
    GetIt.instance.registerSingleton<PostDao>(
      MoorPostDao(db: getIt()),
    );

    //Repos
    GetIt.instance.registerSingleton<AccountRepository>(
      FirebaseAccountRepository(),
    );
    GetIt.instance.registerSingleton<AuthRepository>(
      AuthApiRepository(httpClient: getIt()),
    );
    GetIt.instance.registerSingleton<PhoneSignInRepository>(
      FirebasePhoneSignInRepository(logHandler: getIt()),
    );
    GetIt.instance.registerSingleton<FeedRepository>(
      FeedApiRepository(httpClient: getIt()),
    );

    //bloc observer
    Bloc.observer = DefaultBlocObserver(logHandler: getIt());

    //Blocs
    GetIt.instance.registerSingleton<AuthenticationBloc>(
      AuthenticationBloc(
        phoneSignInRepository: getIt(),
        accountRepository: getIt(),
        authRepository: getIt(),
      ),
    );

    ///App level subscriptions
    GetIt.instance.registerSingleton(AccountDataSubscription(
      repository: getIt(),
      httpClient: getIt(),
    ));
  }
}
