import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';

import 'package:simple_feed/src/data/auth/repository/sign_in/phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/sign_in_status.dart';
import 'package:simple_feed/src/util/log_handler/log_handler.dart';

class FirebasePhoneSignInRepository implements PhoneSignInRepository {
  final LogHandler _logHandler;
  final FirebaseAuth _firebaseAuth;
  String verificationId;
  @override
  String phoneNumber;

  FirebasePhoneSignInRepository({
    @required LogHandler logHandler,
    @required FirebaseAuth firebaseAuth,
  })  : assert(logHandler != null),
        assert(firebaseAuth != null),
        _firebaseAuth = firebaseAuth,
        _logHandler = logHandler;

  @override
  BehaviorSubject<PhoneSignInStatus> signInStatusStream =
      BehaviorSubject<PhoneSignInStatus>();

  @override
  Future<void> sendCodeToPhone(String phone) {
    phoneNumber = phone;
    signInStatusStream.add(PhoneSignInSendingCode());
    return _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(minutes: 1),
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _onVerificationCodeSent,
      codeAutoRetrievalTimeout: _phoneCodeRetrievalTimeOut,
    );
  }

  @override
  Future<void> verifyCode(String code) {
    signInStatusStream.add(PhoneSignInAttemptingVerification());
    var credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: code,
    );
    return _onVerificationCompleted(credential);
  }

  Future<void> _onVerificationCompleted(AuthCredential authCredential) async {
    try {
      await _firebaseAuth.signInWithCredential(authCredential);
      signInStatusStream.add(PhoneSignInSuccess());
    } catch (e, stacktrace) {
      signInStatusStream.add(PhoneSignInFailed("$e"));
      _logHandler.error("$e", stackTrace: stacktrace);
    }
  }

  void _onVerificationFailed(FirebaseAuthException error) {
    var errorMessage = "[ERROR CODE: ${error.code}] ${error.message}";
    signInStatusStream.add(PhoneSignInFailed(errorMessage));
    _logHandler.error(errorMessage);
  }

  void _onVerificationCodeSent(String verificationId,
      [int forceResendingToken]) {
    this.verificationId = verificationId;
    signInStatusStream.add(PhoneSignInCodeSent());
  }

  void _phoneCodeRetrievalTimeOut(String verificationId) =>
      this.verificationId = verificationId;

  @override
  Future<void> close() => signInStatusStream.close();
}
