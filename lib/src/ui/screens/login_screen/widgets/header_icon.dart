part of '../login_screen.dart';

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Image.asset(
        AppConstants.chatImagePath,
      ),
    );
  }
}
