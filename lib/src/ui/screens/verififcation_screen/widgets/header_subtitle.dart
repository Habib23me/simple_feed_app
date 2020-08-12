part of '../verification_screen.dart';

class _HeaderSubTitle extends StatelessWidget {
  String get number => "+251941232484";
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
        TextSpan(
          text: "$number",
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
        )
      ]),
    );
  }
}
