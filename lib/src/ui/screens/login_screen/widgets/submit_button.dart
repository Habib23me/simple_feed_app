part of '../login_screen.dart';

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.maxFinite,
      height: 60,
      textTheme: ButtonTextTheme.accent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: RaisedButton(
        onPressed: context.bloc<PhoneSignInFormBloc>().submit,
        color: Theme.of(context).primaryColor,
        child: Text(
          "Sign in",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
