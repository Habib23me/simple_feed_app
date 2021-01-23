part of '../verification_screen.dart';

class _SubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;

  const _SubmitButton({Key key, this.onSubmit}) : super(key: key);
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
        onPressed: onSubmit,
        color: Theme.of(context).primaryColor,
        child: Text(
          "Verify",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
