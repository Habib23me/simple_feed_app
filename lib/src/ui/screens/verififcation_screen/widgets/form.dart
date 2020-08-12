part of '../verification_screen.dart';

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 5,
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TextField(),
          _SubmitButton(),
        ],
      ),
    );
  }
}
