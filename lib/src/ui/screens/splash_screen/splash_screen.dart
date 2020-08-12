import 'package:flutter/material.dart';
import 'package:simple_feed/src/util/setup/app_constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset(
          AppConstants.chatImagePath,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
