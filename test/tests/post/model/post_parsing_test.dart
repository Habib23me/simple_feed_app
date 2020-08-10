import 'package:flutter_test/flutter_test.dart';
import 'package:simple_feed/src/util/db/moor_db.dart';
import '../../../sample_data/post.dart';
import '../../../setup/dependency_injector.dart';

void main() {
  setUpAll(() {
    TestDependencyInjector.registerDependencies();
  });

  test("parsing post from json has no errors", () {
    expect(() => PostData.fromJson(postJson), returnsNormally);
  });
  test("data is parsed from json and to json correctly", () {
    var post = PostData.fromJson(postJson);
    expect(post.toJson(), expectedPostJson);
  });
  test("parsing from json has no errors (Null Check)", () {
    expect(() => PostData.fromJson({}), returnsNormally);
  });
}
