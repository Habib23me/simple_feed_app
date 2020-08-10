import 'package:flutter_test/flutter_test.dart';
import 'package:simple_feed/src/data/post/dao/moor_post_dao.dart';
import 'package:simple_feed/src/data/post/dao/post_dao.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import '../../../setup/dependency_injector.dart';
import '../../../sample_data/post.dart';

void main() {
  PostDao postDao;
  setUpAll(() {
    TestDependencyInjector.registerDependencies();
    postDao = MoorPostDao(db: getIt());
  });

  test("Storing poppulated and reading data test", () async {
    await postDao.addPost(PostPopulatedData.fromJson(postJson));
    var post = await postDao.getPost(postJson["_id"]);
    expect(post.toJson(), postJson);
  });

  test("Storing poppulated list and reading data test", () async {
    await postDao.addAllPosts([
      PostPopulatedData.fromJson(postJson),
      PostPopulatedData.fromJson(postJson)
    ]);
    var post = await postDao.getPost(postJson["_id"]);
    expect(post.toJson(), postJson);
  });
}
