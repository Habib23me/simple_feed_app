enum PhoneSignInStatus {
  unknown,
  success,
  loading,
  codeSent,
  failed,
}

abstract class PhoneSignInRepository {
  String phoneNumber;
  Stream<PhoneSignInStatus> get signInStatusStream;
  Future<void> sendCodeToPhone(String phone);
  Future<void> verifyCode(String code);
  Future<void> close();
}
