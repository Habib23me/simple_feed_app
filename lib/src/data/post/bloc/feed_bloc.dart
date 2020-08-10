import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:simple_feed/src/data/post/dao/post_dao.dart';
import 'package:simple_feed/src/data/post/model/post_payload.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import 'package:simple_feed/src/data/post/repository/feed/feed_repository.dart';
import 'package:simple_feed/src/util/paginated/model.dart';

class FeedBloc extends Cubit<List<PostPopulatedData>> {
  final FeedRepository _feedRepository;
  PaginatedMetaData _metaData = PaginatedMetaData.empty();
  final PostDao _postDao;

  FeedBloc({@required FeedRepository feedRepository, @required PostDao postDao})
      : assert(feedRepository != null),
        assert(postDao != null),
        _feedRepository = feedRepository,
        _postDao = postDao,
        super(null);

  Future<void> getFeed({int page}) async {
    if (!_metaData.hasMorePages) {
      return;
    }
    var apiResponse = await _feedRepository.getFeed(
      page: page ?? _metaData.nextPage,
    );
    _metaData = apiResponse.meta;
    await _postDao.addAllPosts(apiResponse.docs);
    emit(List.from(state ?? [])..addAll(apiResponse.docs));
  }

  Future<void> postToFeed(PostPayload payload) async {
    var apiResponse = await _feedRepository.postToFeed(payload);
    await _postDao.addPost(apiResponse);
    emit(List.from(state ?? [])..insert(0, apiResponse));
  }
}
