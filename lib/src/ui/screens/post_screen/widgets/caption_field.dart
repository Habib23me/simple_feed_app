part of '../post_screen.dart';

class _CaptionField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: TextField(
        autofocus: true,
        maxLines: 5,
        decoration: InputDecoration.collapsed(hintText: "What's happening?"),
      ),
    );
  }
}
