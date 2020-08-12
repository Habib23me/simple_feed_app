part of '../login_screen.dart';

class _FormListner extends StatelessWidget {
  final Widget child;

  const _FormListner({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FormBlocListener<PhoneSignInFormBloc, String, String>(
      onLoading: (_, __) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: ListTile(
          title: Text("Loading"),
          subtitle: Text("Please wait..."),
          trailing: CircularProgressIndicator(),
        )));
      },
      onFailure: (_, __) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong")),
        );
      },
      onLoaded: (_, __) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => VerificationScreen()),
      ),
      child: child,
    );
  }
}
