import 'package:simple_feed/src/data/post/model/post_populated.dart';

abstract class PostDao {
  Future<void> addPost(PostPopulatedData data);

  Future<PostPopulatedData> getPost(String id);

  Future<void> updatePost(PostPopulatedData data);

  Stream<PostPopulatedData> watch(String id);

  addAllPosts(List<PostPopulatedData> data) {}
}
