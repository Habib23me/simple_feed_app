import 'package:simple_feed/src/data/post/model/post_payload.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import 'package:simple_feed/src/util/paginated/model.dart';

abstract class FeedRepository {
  Future<Paginated<PostPopulatedData>> getFeed({int page = 1});

  Future<PostPopulatedData> postToFeed(PostPayload payload);
}
