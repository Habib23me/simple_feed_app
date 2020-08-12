import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/firebase_phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/sign_in_status.dart';

import '../../../setup/dependency_injector.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  const correctCode = "123456";
  const inCorrectCode = "123156";

  const correctPhone = "+251912345678";

  setUpAll(() {
    TestDependencyInjector.registerDependencies();
  });
  test("Calling send code to phone updates stream", () async {
    var mockFirebaseAuth = MockFirebaseAuth();

    var repo = FirebasePhoneSignInRepository(
      logHandler: getIt(),
      firebaseAuth: mockFirebaseAuth,
    );
    expectLater(
      repo.signInStatusStream,
      emitsInOrder(
        [
          isA<PhoneSignInSendingCode>(),
        ],
      ),
    );
    repo.sendCodeToPhone(correctPhone);
    verify(mockFirebaseAuth.verifyPhoneNumber(
      phoneNumber: anyNamed("phoneNumber"),
      timeout: anyNamed("timeout"),
      verificationCompleted: anyNamed("verificationCompleted"),
      verificationFailed: anyNamed("verificationFailed"),
      codeSent: anyNamed("codeSent"),
      codeAutoRetrievalTimeout: anyNamed("codeAutoRetrievalTimeout"),
    ));
  });
  test("Calling verify updates stream", () async {
    var mockFirebaseAuth = MockFirebaseAuth();
    var repo = FirebasePhoneSignInRepository(
      logHandler: getIt(),
      firebaseAuth: mockFirebaseAuth,
    );
    expectLater(
      repo.signInStatusStream,
      emitsInOrder(
        [
          isA<PhoneSignInAttemptingVerification>(),
          isA<PhoneSignInSuccess>(),
        ],
      ),
    );
    repo.verifyCode(correctCode);
    verify(mockFirebaseAuth.signInWithCredential(any));
  });
  test("Incorrect verification code emits Failed", () async {
    // var mockFirebaseAuth = MockFirebaseAuth();
    // var repo = FirebasePhoneSignInRepository(
    //   logHandler: getIt(),
    //   firebaseAuth: mockFirebaseAuth,
    // );
    // when(mockFirebaseAuth.signInWithCredential(any)).thenThrow(throwable)
    // expectLater(
    //  (){},
    //   throwsException(

    //   ),
    // );
    // repo.verifyCode(inCorrectCode);
    // verify(mockFirebaseAuth.signInWithCredential(any));
  });
}
