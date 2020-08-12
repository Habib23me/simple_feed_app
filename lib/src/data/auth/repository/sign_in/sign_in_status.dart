class PhoneSignInStatus {}

class PhoneSignInSuccess implements PhoneSignInStatus {}

class PhoneSignInFailed implements PhoneSignInStatus {
  final String errorMessage;

  PhoneSignInFailed(this.errorMessage);
}

class PhoneSignInAttemptingVerification implements PhoneSignInStatus {}

class PhoneSignInSendingCode implements PhoneSignInStatus {}

class PhoneSignInCodeSent implements PhoneSignInStatus {}
