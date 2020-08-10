import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_feed/src/data/post/dao/post_dao.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import 'package:simple_feed/src/data/post/repository/post/post_repository.dart';

class PostBloc extends Cubit<PostPopulatedData> {
  final PostDao _postDao;
  final PostRepository _postRepository;
  StreamSubscription _streamSubscription;

  PostBloc({
    @required PostPopulatedData state,
    @required PostDao postDao,
    @required PostRepository postRepository,
  })  : assert(state != null),
        assert(postDao != null),
        assert(postRepository != null),
        _postRepository = postRepository,
        _postDao = postDao,
        super(state) {
    _streamSubscription =
        _postDao.watch(state.post.id).skip(1).listen(onUpdate);
  }
  String get id => state.post.id;

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  void onUpdate(data) => emit(data);

  Future<void> likePost() async {
    if (state.post.isLiked) {
      return;
    }
    var newPost = state.post.copyWith(
      likes: state.post.likes + 1,
      isLiked: true,
    );
    var updatedData = state.copyWith(post: newPost);
    emit(updatedData);
    await _postDao.updatePost(updatedData);
    await _postRepository.likePost(id);
  }

  Future<void> unlikePost() async {
    if (!state.post.isLiked) {
      return;
    }
    var newPost = state.post.copyWith(
      likes: state.post.likes - 1,
      isLiked: false,
    );
    var updatedData = state.copyWith(post: newPost);
    emit(updatedData);
    await _postDao.updatePost(updatedData);
    await _postRepository.unlikePost(id);
  }
}
