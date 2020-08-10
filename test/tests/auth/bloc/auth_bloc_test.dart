import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/subjects.dart';
import 'package:simple_feed/src/data/auth/bloc/auth_bloc.dart';
import 'package:simple_feed/src/data/auth/model/account.dart';
import 'package:simple_feed/src/data/auth/model/verify_account.dart';
import 'package:simple_feed/src/data/auth/repository/account/mock_account_repository.dart';
import 'package:simple_feed/src/data/auth/repository/auth/mock_auth_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/mock_phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/phone_sign_in_repository.dart';

import '../../../setup/dependency_injector.dart';

void main() {
  const correctCode = "123456";
  const correctPhone = "+251912345678";

  setUpAll(() {
    TestDependencyInjector.registerDependencies();
  });
  test("signing in with correct phone and code emits authenticated", () async {
    var phoneSignInRepo = MockPhoneSignInRepository();
    var accountRepo = MockAccountRepository();
    var authRepo = MockAuthRepository();

    var signInStatusStream = BehaviorSubject<PhoneSignInStatus>.seeded(
      PhoneSignInStatus.unknown,
    );

    when(phoneSignInRepo.signInStatusStream).thenAnswer(
      (_) => signInStatusStream,
    );
    when(accountRepo.hasAccount).thenAnswer(
      (_) async => false,
    );

    var bloc = AuthenticationBloc(
      phoneSignInRepository: phoneSignInRepo,
      accountRepository: accountRepo,
      authRepository: authRepo,
    );
    expectLater(
      bloc,
      emitsInOrder([AuthState.unAuthenticated, AuthState.authenticated]),
    );
    await bloc.sendCodeToPhone(correctPhone);
    await bloc.verifyCode(correctCode);
    verify(phoneSignInRepo.sendCodeToPhone(correctPhone));
    verify(phoneSignInRepo.verifyCode(correctCode));
    signInStatusStream.add(PhoneSignInStatus.success);
  });

  test("calling sign out emits unauthenticated state", () async {
    var phoneSignInRepo = MockPhoneSignInRepository();
    var accountRepo = MockAccountRepository();
    var authRepo = MockAuthRepository();

    var signInStatusStream = BehaviorSubject<PhoneSignInStatus>.seeded(
      PhoneSignInStatus.unknown,
    );

    when(phoneSignInRepo.signInStatusStream).thenAnswer(
      (_) => signInStatusStream,
    );
    when(accountRepo.hasAccount).thenAnswer(
      (_) async => true,
    );

    var bloc = AuthenticationBloc(
      phoneSignInRepository: phoneSignInRepo,
      accountRepository: accountRepo,
      authRepository: authRepo,
    );
    expectLater(
      bloc,
      emitsInOrder([AuthState.authenticated, AuthState.unAuthenticated]),
    );
    await bloc.signOut();
  });
}
