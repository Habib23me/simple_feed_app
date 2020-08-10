import 'dart:io';
import 'package:meta/meta.dart';

class PostPayload {
  final String caption;
  final File file;

  PostPayload({@required this.file, @required this.caption});

  @override
  String toString() => 'PostPayload(file: ${file.path}, caption: $caption)';

  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
    };
  }

  PostPayload copyWith({
    File file,
    String caption,
  }) {
    return PostPayload(
      file: file ?? this.file,
      caption: caption ?? this.caption,
    );
  }
}
