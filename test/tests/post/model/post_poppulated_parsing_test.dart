import 'package:flutter_test/flutter_test.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import '../../../setup/dependency_injector.dart';
import '../../../sample_data/post.dart';

void main() {
  setUpAll(() {
    TestDependencyInjector.registerDependencies();
  });

  test("parsing post from json has no errors", () {
    expect(() => PostPopulatedData.fromJson(postJson), returnsNormally);
  });
  test("data is parsed from json and to json correctly", () {
    var data = PostPopulatedData.fromJson(postJson);
    expect(data.toJson(), postJson);
  });
  test("parsing from json has no errors (Null Check)", () {
    expect(() => PostPopulatedData.fromJson({}), returnsNormally);
  });
}
