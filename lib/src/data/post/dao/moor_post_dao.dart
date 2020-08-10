import 'package:meta/meta.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'package:simple_feed/src/data/post/dao/post_dao.dart';
import 'package:simple_feed/src/data/post/model/post.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';
import 'package:simple_feed/src/data/user/model/user.dart';
import 'package:simple_feed/src/util/db/moor_db.dart';

part 'moor_post_dao.g.dart';

@UseDao(tables: [User, Post])
class MoorPostDao extends DatabaseAccessor<MoorDatabase>
    with _$MoorPostDaoMixin
    implements PostDao {
  MoorPostDao({@required MoorDatabase db})
      : assert(db != null),
        super(db);

  @override
  Future<void> addAllPosts(List<PostPopulatedData> data) async {
    await batch((b) => b.insertAll(
          this.user,
          data.map((e) => e.user).toList(),
          mode: InsertMode.insertOrReplace,
        ));
    await batch((b) => b.insertAll(
          this.post,
          data.map((e) => e.post).toList(),
          mode: InsertMode.insertOrReplace,
        ));
  }

  @override
  Future<void> addPost(PostPopulatedData data) async {
    await into(this.user).insert(data.user, mode: InsertMode.insertOrReplace);
    await into(this.post).insert(data.post, mode: InsertMode.insertOrReplace);
  }

  @override
  Future<PostPopulatedData> getPost(String id) => _getById(id).getSingle();

  @override
  Future<void> updatePost(PostPopulatedData data) =>
      update(this.post).replace(data.post);

  @override
  Stream<PostPopulatedData> watch(String id) => _getById(id).watchSingle();

  Selectable<PostPopulatedData> _getById(String id) => _getByIdQuery(id).join(
        [
          leftOuterJoin(user, user.id.equalsExp(post.userId)),
        ],
      ).map(_map);

  SimpleSelectStatement<Post, PostData> _getByIdQuery(String id) =>
      select(this.post)..where((t) => t.id.equals(id));

  PostPopulatedData _map(row) => (PostPopulatedData(
        post: row.readTable(post),
        user: row.readTable(user),
      ));
}
