import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_feed/src/data/auth/model/verify_account.dart';
import 'package:simple_feed/src/data/auth/repository/account/account_repository.dart';
import 'package:simple_feed/src/data/auth/repository/auth/auth_repository.dart';

import 'package:simple_feed/src/data/auth/repository/sign_in/phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/sign_in_status.dart';

enum AuthState {
  unknown,
  authenticated,
  unAuthenticated,
}

class AuthenticationBloc extends Cubit<AuthState> {
  final AccountRepository _accountRepository;
  final PhoneSignInRepository _phoneSignInRepository;
  final AuthRepository _authRepository;
  StreamSubscription _phoneSignInStatusSubscription;

  AuthenticationBloc({
    @required PhoneSignInRepository phoneSignInRepository,
    @required AccountRepository accountRepository,
    @required AuthRepository authRepository,
  })  : assert(phoneSignInRepository != null),
        assert(accountRepository != null),
        assert(authRepository != null),
        _phoneSignInRepository = phoneSignInRepository,
        _accountRepository = accountRepository,
        _authRepository = authRepository,
        super(AuthState.unknown) {
    _phoneSignInStatusSubscription = _phoneSignInRepository.signInStatusStream
        .listen(onPhoneSignInStatusUpdate);
    checkIfSignedIn();
  }
  Future<void> onPhoneSignInStatusUpdate(PhoneSignInStatus status) async {
    if (status is PhoneSignInSuccess) {
      await _authRepository.signIn(
        VerifyAccountPayload(
          phoneNumber: _phoneSignInRepository.phoneNumber,
        ),
      );
      emit(AuthState.authenticated);
    }
  }

  Future<void> checkIfSignedIn() async {
    var hasAccount = await _accountRepository.hasAccount;
    if (hasAccount) {
      emit(AuthState.authenticated);
    } else {
      emit(AuthState.unAuthenticated);
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    await _accountRepository.removeAccount();
    emit(AuthState.unAuthenticated);
  }

  @override
  Future<void> close() {
    _phoneSignInStatusSubscription.cancel();
    return super.close();
  }
}
