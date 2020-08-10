import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/subjects.dart';
import 'package:simple_feed/src/data/auth/model/account.dart';
import 'package:simple_feed/src/data/auth/repository/account/mock_account_repository.dart';
import 'package:simple_feed/src/data/auth/util/account_data_subscription.dart';
import 'package:simple_feed/src/util/http_client/mock_http_client.dart';

void main() {
  test(
      "When user account is found the Authorization Header is updated with a token",
      () async {
    var httpClient = MockHttpClient();
    var accountRepository = MockAccountRepository();
    var accountStream = BehaviorSubject<AccountData>();
    var token = "TEST_TOKEN";
    when(accountRepository.accountStream).thenAnswer((_) => accountStream);

    AccountDataSubscription(
      httpClient: httpClient,
      repository: accountRepository,
    );
    accountStream.add(AccountData(token: token));
    await Future.delayed(Duration(seconds: 1));
    verify(httpClient.addAuthorizationHeader(token));
  });
  test("When user account is removed the Authorization Header is removed",
      () async {
    var httpClient = MockHttpClient();
    var accountRepository = MockAccountRepository();
    var accountStream = BehaviorSubject<AccountData>();
    when(accountRepository.accountStream).thenAnswer((_) => accountStream);

    AccountDataSubscription(
      httpClient: httpClient,
      repository: accountRepository,
    );
    accountStream.add(null);
    await Future.delayed(Duration(seconds: 1));
    verify(httpClient.removeAuthorizationHeader());
  });
}
