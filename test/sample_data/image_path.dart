import 'package:path/path.dart';
import 'dart:io';

String get imagePath {
  const image = "sample.png";
  var currentDir = Directory.current;
  return join(currentDir.absolute.path, image);
}
