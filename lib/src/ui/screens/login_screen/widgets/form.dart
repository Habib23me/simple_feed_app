part of '../login_screen.dart';

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhoneSignInFormBloc(
        phoneSignInRepository: getIt(),
      ),
      child: _FormListner(
        child: Container(
          height: MediaQuery.of(context).size.height * 1 / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TextField(),
              _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
