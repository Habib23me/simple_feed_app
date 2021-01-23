part of '../verification_screen.dart';

class _HeaderSubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "We have sent a 6 digit verification code to your number ",
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 16.0,
              ),
        ),
      ]),
    );
  }
}
