import 'dart:async';

import 'package:meta/meta.dart';

import 'package:simple_feed/src/data/auth/bloc/auth_bloc.dart';
import 'package:simple_feed/src/data/auth/model/account.dart';
import 'package:simple_feed/src/data/auth/repository/account/account_repository.dart';
import 'package:simple_feed/src/util/http_client/http_client.dart';
import 'package:simple_feed/src/util/setup/dependency_injector.dart';

class AccountDataSubscription {
  StreamSubscription _streamSubscription;
  final HttpClient _httpClient;
  AccountDataSubscription({
    @required AccountRepository repository,
    @required HttpClient httpClient,
  })  : assert(repository != null),
        assert(httpClient != null),
        _httpClient = httpClient {
    _streamSubscription =
        repository.accountStream.listen((AccountData account) async {
      if (account != null) {
        _onAccountUpdate(account);
      } else {
        _onAccountRemoved();
      }
    });
  }

  _onAccountUpdate(AccountData account) {
    _httpClient.addAuthorizationHeader(account.token);
  }

  _onAccountRemoved() {
    _httpClient.removeAuthorizationHeader();
  }

  close() {
    _streamSubscription.cancel();
  }
}
