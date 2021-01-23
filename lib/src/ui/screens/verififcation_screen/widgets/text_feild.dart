part of '../verification_screen.dart';

class _TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(
        signed: false,
        decimal: false,
      ),
      maxLength: 6,
      onSaved: (value) {
        getIt<PhoneSignInRepository>().verifyCode(value);
      },
      decoration: InputDecoration(
        labelText: "Verification code",
      ),
    );
  }
}
