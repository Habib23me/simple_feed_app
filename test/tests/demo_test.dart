import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/subjects.dart';

void main() {
  test("test", () {
    var subject = BehaviorSubject();
    subject.add("Hello");
    print(subject.value);
  });
}
