part of '../login_screen.dart';

class _TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      keyboardType: TextInputType.numberWithOptions(
        signed: false,
        decimal: false,
      ),
      decoration: InputDecoration(
        labelText: "Phone number",
        prefix: Text(
          "${PhoneSignInFormBloc.prefix}",
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
      ),
      textFieldBloc: context.bloc<PhoneSignInFormBloc>().phoneField,
    );
  }
}
