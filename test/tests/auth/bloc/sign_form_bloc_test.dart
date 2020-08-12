import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_feed/src/data/auth/repository/account/mock_account_repository.dart';
import 'package:simple_feed/src/data/auth/repository/auth/mock_auth_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/mock_phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/sign_in_status.dart';
import 'package:simple_feed/src/data/forms/phone_sign_in/bloc.dart';

import '../../../setup/dependency_injector.dart';

void main() {
  const correctPhone = "+251912345678";

  setUpAll(() {
    TestDependencyInjector.registerDependencies();
  });
  test("sign in form emits loaded when verification code is sent", () async {
    var phoneSignInRepo = MockPhoneSignInRepository();

    var signInStatusStream = BehaviorSubject<PhoneSignInStatus>();

    when(phoneSignInRepo.signInStatusStream).thenAnswer(
      (_) => signInStatusStream,
    );
    var bloc = PhoneSignInFormBloc(phoneSignInRepository: phoneSignInRepo);
    expectLater(
        bloc.skip(1),
        emitsInOrder([
          isA<FormBlocSuccess>(),
        ]));
    await phoneSignInRepo.sendCodeToPhone(correctPhone);

    verify(phoneSignInRepo.sendCodeToPhone(correctPhone));
    signInStatusStream.add(PhoneSignInCodeSent());
    await Future.delayed(Duration(seconds: 2));
    bloc.close();
  });
}
