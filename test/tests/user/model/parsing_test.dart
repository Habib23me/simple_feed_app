import 'package:flutter_test/flutter_test.dart';
import 'package:simple_feed/src/util/db/moor_db.dart';

import '../../../sample_data/user.dart';
import '../../../setup/dependency_injector.dart';

void main() {
  setUpAll(() {
    TestDependencyInjector.registerDependencies();
  });

  test("parsing from json has no errors", () {
    expect(() => UserData.fromJson(userJson), returnsNormally);
  });
  test("data is parsed from json and to json correctly", () {
    var user = UserData.fromJson(userJson);
    expect(user.toJson(), userJson);
  });

  test("parsing from json has no errors (Null Check)", () {
    expect(() => UserData.fromJson({}), returnsNormally);
  });
}
