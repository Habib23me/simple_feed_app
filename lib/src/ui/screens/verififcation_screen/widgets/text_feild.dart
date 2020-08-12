part of '../verification_screen.dart';

class _TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(
        signed: false,
        decimal: false,
      ),
      maxLength: 6,
      decoration: InputDecoration(
        labelText: "Verification code",
      ),
    );
  }
}
