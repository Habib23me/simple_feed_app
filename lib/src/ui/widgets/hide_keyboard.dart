import 'package:flutter/material.dart';

class HideKeyboardOnTap extends StatelessWidget {
  final Widget child;

  const HideKeyboardOnTap({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: child, onTap: () => FocusNode()..requestFocus());
  }
}
