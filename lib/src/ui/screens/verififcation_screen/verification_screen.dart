import 'package:flutter/material.dart';
import 'package:simple_feed/src/ui/widgets/hide_keyboard.dart';
import 'package:simple_feed/src/util/setup/app_constants.dart';

import '../../../data/auth/repository/sign_in/phone_sign_in_repository.dart';
import '../../../data/auth/repository/sign_in/phone_sign_in_repository.dart';
import '../../../data/auth/repository/sign_in/phone_sign_in_repository.dart';
import '../../../util/setup/dependency_injector.dart';
part 'widgets/header_icon.dart';
part 'widgets/header.dart';
part 'widgets/header_subtitle.dart';
part 'widgets/text_feild.dart';
part 'widgets/submit_button.dart';
part 'widgets/form.dart';

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HideKeyboardOnTap(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  _Header(),
                  _Form(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
