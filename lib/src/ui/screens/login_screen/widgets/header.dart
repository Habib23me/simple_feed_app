part of '../login_screen.dart';

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 2.2 / 5,
      // color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _HeaderIcon(),
          SizedBox(
            height: 28,
          ),
          _HeaderTitle(),
        ],
      ),
    );
  }
}
