import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart';
import 'package:simple_feed/src/data/post/bloc/feed_bloc.dart';
import 'package:simple_feed/src/data/post/dao/moor_post_dao.dart';
import 'package:simple_feed/src/data/post/dao/post_dao.dart';
import 'package:simple_feed/src/data/post/model/post_payload.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import 'package:simple_feed/src/data/post/repository/feed/feed_api_repository.dart';
import 'package:simple_feed/src/data/post/repository/feed/feed_repository.dart';
import 'package:simple_feed/src/util/http_client/dio_http_client.dart';
import 'package:simple_feed/src/util/http_client/mock_http_client.dart';
import 'package:simple_feed/src/util/setup/app_constants.dart';
import '../../../sample_data/image_path.dart';
import '../../../sample_data/post.dart';
import '../../../setup/dependency_injector.dart';

void main() {
  PostDao postDao;
  setUpAll(() {
    TestDependencyInjector.registerDependencies();
    postDao = MoorPostDao(db: getIt());
  });
  group("with mocked http client", () {
    FeedRepository feedRepository;
    MockHttpClient httpClient;
    setUpAll(() {
      httpClient = MockHttpClient();
      feedRepository = FeedApiRepository(httpClient: httpClient);

      logInvocations([httpClient]);
    });
    blocTest(
      "fetching feed emits a new state",
      build: () => FeedBloc(
        postDao: postDao,
        feedRepository: feedRepository,
      ),
      act: (bloc) async {
        when(httpClient.get(
          join(AppConstants.testBaseUrl, FeedApiRepository.feedPath),
          queryParameters: {"page": 1},
        )).thenAnswer((_) async => paginatedPostJson);
        await bloc.getFeed(page: 1);
      },
      expect: [
        isA<List<PostPopulatedData>>(),
      ],
    );
    blocTest(
      "posting a feed emits a new state",
      build: () => FeedBloc(
        postDao: postDao,
        feedRepository: feedRepository,
      ),
      act: (bloc) async {
        var post = PostPayload(file: File(imagePath), caption: "habib");
        when(httpClient.multiPartPost(
          join(AppConstants.testBaseUrl, FeedApiRepository.feedPath),
          files: [post.file],
          data: post.toJson(),
        )).thenAnswer((_) async => postJson);
        await bloc.postToFeed(post);
      },
      expect: [
        isA<List<PostPopulatedData>>(),
      ],
    );
  });

  group("with dio http client", () {
    FeedRepository feedRepository;
    DioHttpClient httpClient;
    setUpAll(() {
      httpClient = DioHttpClient(
        baseUrl: AppConstants.testBaseUrl,
        logHandler: getIt(),
      );
      feedRepository = FeedApiRepository(httpClient: httpClient);
    });
    blocTest(
      "fetching feed emits a new state",
      build: () => FeedBloc(
        postDao: postDao,
        feedRepository: feedRepository,
      ),
      act: (bloc) async {
        await bloc.getFeed(page: 1);
      },
      expect: [
        isA<List<PostPopulatedData>>(),
      ],
    );
    blocTest(
      "posting a feed emits a new state",
      build: () => FeedBloc(
        postDao: postDao,
        feedRepository: feedRepository,
      ),
      act: (bloc) async {
        var post = PostPayload(file: File(imagePath), caption: "habib");
        await bloc.postToFeed(post);
      },
      expect: [
        isA<List<PostPopulatedData>>(),
      ],
    );
  });
}
