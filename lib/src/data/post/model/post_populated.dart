import 'package:simple_feed/src/util/db/moor_db.dart';

class PostPopulatedData {
  final PostData post;
  final UserData user;

  PostPopulatedData({this.post, this.user});

  PostPopulatedData copyWith({
    PostData post,
    UserData user,
  }) {
    return PostPopulatedData(
      post: post ?? this.post,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ...post?.toJson(),
      'user': user?.toJson(),
    };
  }

  factory PostPopulatedData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return PostPopulatedData(
      post: PostData.fromJson(json),
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }

  @override
  String toString() => 'PostPopulatedData(post: $post, user: $user)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostPopulatedData && o.post == post && o.user == user;
  }

  @override
  int get hashCode => post.hashCode ^ user.hashCode;
}
