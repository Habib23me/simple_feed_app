part of '../verification_screen.dart';

class _Form extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: MediaQuery.of(context).size.height * 1 / 5,
        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TextField(),
            _SubmitButton(
              onSubmit: () => formKey.currentState.save(),
            ),
          ],
        ),
      ),
    );
  }
}
