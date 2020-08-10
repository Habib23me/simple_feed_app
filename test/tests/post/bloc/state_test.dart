import 'package:flutter_test/flutter_test.dart';
import 'package:simple_feed/src/data/post/bloc/post_bloc.dart';
import 'package:simple_feed/src/data/post/dao/moor_post_dao.dart';
import 'package:simple_feed/src/data/post/dao/post_dao.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import 'package:simple_feed/src/data/post/repository/post/post_api_repository.dart';
import 'package:simple_feed/src/data/post/repository/post/post_repository.dart';
import 'package:simple_feed/src/util/http_client/mock_http_client.dart';

import '../../../sample_data/post.dart';
import '../../../setup/dependency_injector.dart';

void main() {
  PostDao postDao;
  setUpAll(() {
    TestDependencyInjector.registerDependencies();
    postDao = MoorPostDao(db: getIt());
  });

  group("with mock http client", () {
    MockHttpClient httpClient;
    PostRepository postRepository;

    setUpAll(() {
      httpClient = MockHttpClient();
      postRepository = PostApiRepository(httpClient: httpClient);
    });

    test("Liking a post emits a new state", () async {
      var data = PostPopulatedData.fromJson(postJson);

      var bloc = PostBloc(
        state: data,
        postDao: postDao,
        postRepository: postRepository,
      );

      expectLater(
        bloc.map((event) => event.post.likes),
        emitsInOrder([data.post.likes + 1, data.post.likes]),
      );
      expectLater(
        bloc.map((data) => data.post.isLiked),
        emitsInOrder([true, false]),
      );
      await bloc.likePost();
      await bloc.unlikePost();
      await Future.delayed(Duration(seconds: 3));
      bloc.close();
    });
    test("Liking a post updates the database", () async {
      var data = PostPopulatedData.fromJson(postJson);
      await postDao.addPost(data);

      var bloc = PostBloc(
        state: data,
        postDao: postDao,
        postRepository: postRepository,
      );
      await bloc.likePost();
      var updatedData = await postDao.getPost(postJson["_id"]);
      expect(updatedData.post.isLiked, true);
      expect(updatedData.post.likes, data.post.likes + 1);
    });

    test("Liking an already liked post doesn't emit a new state", () async {
      var data = PostPopulatedData.fromJson(postJson);

      var bloc = PostBloc(
        state: data,
        postDao: postDao,
        postRepository: postRepository,
      );

      expectLater(
        bloc.skip(1),
        emitsInOrder([]),
      );
      bloc.likePost();
      bloc.likePost();
      await Future.delayed(Duration(seconds: 3));
      bloc.close();
    });
    test(
        "update of a post from a different bloc instance is reflected on the current bloc",
        () async {
      var data = PostPopulatedData.fromJson(postJson);
      await postDao.addPost(data);

      var bloc = PostBloc(
        state: data,
        postDao: postDao,
        postRepository: postRepository,
      );

      expectLater(
        bloc.map((data) => data.post.likes),
        emits(data.post.likes + 1),
      );
      expectLater(
        bloc.map((data) => data.post.isLiked),
        emits(true),
      );
      await PostBloc(
        state: data,
        postDao: postDao,
        postRepository: postRepository,
      ).likePost();
      await Future.delayed(Duration(seconds: 2));
      bloc.close();
    });
  });
}
