import 'package:meta/meta.dart';

import 'package:simple_feed/src/data/post/model/post_payload.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import 'package:simple_feed/src/util/exception/network_exception.dart';
import 'package:simple_feed/src/util/http_client/http_client.dart';
import 'package:simple_feed/src/util/paginated/model.dart';

import 'feed_repository.dart';

class FeedApiRepository implements FeedRepository {
  static const feedPath = "/posts";

  final HttpClient _httpClient;

  FeedApiRepository({@required HttpClient httpClient})
      : assert(httpClient != null),
        _httpClient = httpClient;

  @override
  Future<Paginated<PostPopulatedData>> getFeed({int page = 1}) async {
    var response =
        await _httpClient.get<Map>(feedPath, queryParameters: {"page": page});
    if (response == null) {
      throw NetworkException(
        message: "Something went wrong while fetching feed",
        cause: "Api response was null",
      );
    }
    return Paginated.fromJson(
      response,
      (json) => PostPopulatedData.fromJson(json),
    );
  }

  @override
  Future<PostPopulatedData> postToFeed(PostPayload payload) async {
    var response = await _httpClient.multiPartPost<Map>(
      feedPath,
      data: payload.toJson(),
      files: [payload.file],
    );
    if (response == null) {
      throw NetworkException(
        message: "Something went wrong while posting to feed",
        cause: "Api response was null",
      );
    }
    return PostPopulatedData.fromJson(response);
  }
}
