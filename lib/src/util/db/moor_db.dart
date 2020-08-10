import 'package:meta/meta.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'package:simple_feed/src/data/post/dao/moor_post_dao.dart';
import 'package:simple_feed/src/data/post/model/post.dart';
import 'package:simple_feed/src/data/user/model/user.dart';

part 'moor_db.g.dart';

@UseMoor(tables: [User, Post], daos: [MoorPostDao])
class MoorDatabase extends _$MoorDatabase {
  MoorDatabase({
    @required QueryExecutor dbAccessor,
    @required ValueSerializer valueSerializer,
  })  : assert(dbAccessor != null),
        assert(valueSerializer != null),
        super(dbAccessor) {
    moorRuntimeOptions.defaultSerializer = valueSerializer;
  }

  @override
  int get schemaVersion => 1;
}
