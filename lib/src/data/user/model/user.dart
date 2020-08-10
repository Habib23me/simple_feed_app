import 'package:moor_flutter/moor_flutter.dart';

class User extends Table {
  @override
  Set<Column> get primaryKey => {id};

  @JsonKey("_id")
  TextColumn get id => text()();

  TextColumn get username => text()();

  TextColumn get name => text()();

  TextColumn get profilePic => text()();

  TextColumn get bio => text().nullable()();

  TextColumn get account => text()();

  IntColumn get followers => integer()();

  IntColumn get followings => integer()();

  IntColumn get posts => integer()();

  @JsonKey("created_at")
  DateTimeColumn get createdAt => dateTime()();

  @JsonKey("updated_at")
  DateTimeColumn get updatedAt => dateTime()();
}
