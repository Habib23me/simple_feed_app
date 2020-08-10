abstract class PostRepository {
  Future<void> likePost(String id);

  Future<void> unlikePost(String id);
}
