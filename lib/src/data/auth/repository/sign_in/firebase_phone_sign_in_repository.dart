import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';

import 'package:simple_feed/src/data/auth/repository/sign_in/phone_sign_in_repository.dart';
import 'package:simple_feed/src/util/log_handler/log_handler.dart';

class FirebasePhoneSignInRepository implements PhoneSignInRepository {
  final LogHandler _logHandler;
  String verificationId;
  @override
  String phoneNumber;

  FirebasePhoneSignInRepository({@required LogHandler logHandler})
      : assert(logHandler != null),
        _logHandler = logHandler;
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  @override
  BehaviorSubject<PhoneSignInStatus> get signInStatusStream =>
      BehaviorSubject<PhoneSignInStatus>.seeded(PhoneSignInStatus.unknown);

  @override
  Future<void> sendCodeToPhone(String phone) {
    phoneNumber = phone;
    signInStatusStream.add(PhoneSignInStatus.loading);
    return _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 5),
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _onVerificationCodeSent,
      codeAutoRetrievalTimeout: _phoneCodeRetrievalTimeOut,
    );
  }

  @override
  Future<void> verifyCode(String code) {
    signInStatusStream.add(PhoneSignInStatus.loading);
    var credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: code,
    );
    return _onVerificationCompleted(credential);
  }

  Future<void> _onVerificationCompleted(AuthCredential authCredential) async {
    try {
      await _firebaseAuth.signInWithCredential(authCredential);
      signInStatusStream.add(PhoneSignInStatus.success);
    } catch (e, stacktrace) {
      signInStatusStream.add(PhoneSignInStatus.failed);
      _logHandler.error("$e", stackTrace: stacktrace);
    }
  }

  void _onVerificationFailed(AuthException error) {
    signInStatusStream.add(PhoneSignInStatus.failed);
    _logHandler.error("[ERROR CODE: ${error.code}] ${error.message}");
  }

  void _onVerificationCodeSent(String verificationId,
      [int forceResendingToken]) {
    this.verificationId = verificationId;
    signInStatusStream.add(PhoneSignInStatus.codeSent);
  }

  void _phoneCodeRetrievalTimeOut(String verificationId) =>
      this.verificationId = verificationId;

  @override
  Future<void> close() => signInStatusStream.close();
}
