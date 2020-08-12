import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/phone_sign_in_repository.dart';
import 'package:simple_feed/src/data/auth/repository/sign_in/sign_in_status.dart';
import 'package:simple_feed/src/util/validators/validators.dart';
import 'package:meta/meta.dart';

class PhoneSignInFormBloc extends FormBloc<String, String> {
  static const prefix = "+251";
  final PhoneSignInRepository _phoneSignInRepository;
  final TextFieldBloc phoneField = TextFieldBloc(
    validators: [
      Validators.validatePhone,
    ],
    name: "Phone number",
  );
  StreamSubscription _phoneSignInSubscription;
  PhoneSignInFormBloc({@required PhoneSignInRepository phoneSignInRepository})
      : assert(phoneSignInRepository != null),
        _phoneSignInRepository = phoneSignInRepository {
    addFieldBlocs(fieldBlocs: [phoneField]);
    _phoneSignInSubscription = phoneSignInRepository.signInStatusStream.listen(
      onSignInEvent,
    );
  }
  @override
  Future<void> close() {
    _phoneSignInSubscription?.cancel();
    return super.close();
  }

  onSignInEvent(PhoneSignInStatus status) {
    if (status is PhoneSignInSendingCode) {
      emitLoading();
    } else if (status is PhoneSignInFailed) {
      emitFailure(failureResponse: status.errorMessage);
    } else if (status is PhoneSignInCodeSent) {
      emitSuccess(canSubmitAgain: true);
    }
  }

  @override
  Future<void> onSubmitting() async {
    await _phoneSignInRepository.sendCodeToPhone("$prefix${phoneField.value}");
  }
}
