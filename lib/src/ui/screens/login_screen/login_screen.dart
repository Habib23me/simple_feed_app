import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_feed/src/data/forms/phone_sign_in/bloc.dart';
import 'package:simple_feed/src/ui/screens/verififcation_screen/verification_screen.dart';
import 'package:simple_feed/src/ui/widgets/hide_keyboard.dart';
import 'package:simple_feed/src/util/setup/app_constants.dart';
import 'package:simple_feed/src/util/setup/dependency_injector.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

part 'widgets/header_icon.dart';
part 'widgets/header.dart';
part 'widgets/header_title.dart';
part 'widgets/text_feild.dart';
part 'widgets/submit_button.dart';
part 'widgets/form.dart';
part 'widgets/form_listner.dart';

class LoginScreen extends StatelessWidget {
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
