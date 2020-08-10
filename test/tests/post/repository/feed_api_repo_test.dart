import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_feed/src/data/post/repository/feed/feed_api_repository.dart';
import 'package:simple_feed/src/util/http_client/dio_http_client.dart';
import 'package:simple_feed/src/util/http_client/mock_http_client.dart';
import 'package:simple_feed/src/util/setup/app_constants.dart';
import 'package:path/path.dart';

import '../../../sample_data/post.dart';
import '../../../setup/dependency_injector.dart';

void main() {
  setUpAll(() {
    TestDependencyInjector.registerDependencies();
  });

  group("with Mocked Http Client", () {
    test("fetching and parsing data returns a non null result", () {
      var httpClient = MockHttpClient();
      when(
        httpClient.get(
          join(AppConstants.testBaseUrl, FeedApiRepository.feedPath),
          queryParameters: {"page": 1},
        ),
      ).thenAnswer((_) async => paginatedPostJson);
      var feedRepository = FeedApiRepository(httpClient: httpClient);
      expect(feedRepository.getFeed(page: 1), completion(isNotNull));
    });
  });

  group("with Dio Http Client", () {
    test("fetching and parsing data returns a non null result", () {
      var httpClient = DioHttpClient(
        baseUrl: AppConstants.testBaseUrl,
        logHandler: getIt(),
      );
      var feedRepository = FeedApiRepository(httpClient: httpClient);
      expect(feedRepository.getFeed(page: 1), completion(isNotNull));
    });
  });
}
