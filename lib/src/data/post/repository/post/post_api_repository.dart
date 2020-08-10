import 'package:meta/meta.dart';
import 'package:path/path.dart';

import 'package:simple_feed/src/util/http_client/http_client.dart';

import 'post_repository.dart';

class PostApiRepository implements PostRepository {
  static const likePostPath = "/posts/like";
  static const unlikePostPath = "/posts/unlike";

  final HttpClient _httpClient;

  PostApiRepository({
    @required HttpClient httpClient,
  })  : assert(httpClient != null),
        _httpClient = httpClient;

  @override
  Future<void> likePost(String id) => _httpClient.put(
        join(likePostPath, id),
      );

  @override
  Future<void> unlikePost(String id) => _httpClient.put(
        join(unlikePostPath, id),
      );
}
