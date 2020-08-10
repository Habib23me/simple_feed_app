import 'package:moor_flutter/moor_flutter.dart';

class Post extends Table {
  @override
  Set<Column> get primaryKey => {id};

  @JsonKey("_id")
  TextColumn get id => text()();

  TextColumn get caption => text()();

  TextColumn get image => text()();

  IntColumn get likes => integer()();

  BoolColumn get isLiked => boolean()();

  @JsonKey("created_at")
  DateTimeColumn get createdAt => dateTime()();

  @JsonKey("updated_at")
  DateTimeColumn get updatedAt => dateTime()();

  @JsonKey("user")
  TextColumn get userId => text()();
}
