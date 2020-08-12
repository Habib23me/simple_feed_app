import 'dart:io';

import 'package:flutter/material.dart';
part 'widgets/post_button.dart';
part 'widgets/image_picker.dart';
part 'widgets/caption_field.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_PostButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_ImagePicker(), _CaptionField()],
        ),
      ),
    );
  }
}
