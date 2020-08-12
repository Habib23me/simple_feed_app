part of '../login_screen.dart';

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "Welcome to ",
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        TextSpan(
          text: "Simple Feed",
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
        )
      ]),
    );
  }
}
