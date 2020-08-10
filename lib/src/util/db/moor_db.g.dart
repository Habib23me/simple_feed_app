// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String username;
  final String name;
  final String profilePic;
  final String bio;
  final String account;
  final int followers;
  final int followings;
  final int posts;
  final DateTime createdAt;
  final DateTime updatedAt;
  UserData(
      {@required this.id,
      @required this.username,
      @required this.name,
      @required this.profilePic,
      this.bio,
      @required this.account,
      @required this.followers,
      @required this.followings,
      @required this.posts,
      @required this.createdAt,
      @required this.updatedAt});
  factory UserData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return UserData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      profilePic: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_pic']),
      bio: stringType.mapFromDatabaseResponse(data['${effectivePrefix}bio']),
      account:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}account']),
      followers:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}followers']),
      followings:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}followings']),
      posts: intType.mapFromDatabaseResponse(data['${effectivePrefix}posts']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || profilePic != null) {
      map['profile_pic'] = Variable<String>(profilePic);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || account != null) {
      map['account'] = Variable<String>(account);
    }
    if (!nullToAbsent || followers != null) {
      map['followers'] = Variable<int>(followers);
    }
    if (!nullToAbsent || followings != null) {
      map['followings'] = Variable<int>(followings);
    }
    if (!nullToAbsent || posts != null) {
      map['posts'] = Variable<int>(posts);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['_id']),
      username: serializer.fromJson<String>(json['username']),
      name: serializer.fromJson<String>(json['name']),
      profilePic: serializer.fromJson<String>(json['profilePic']),
      bio: serializer.fromJson<String>(json['bio']),
      account: serializer.fromJson<String>(json['account']),
      followers: serializer.fromJson<int>(json['followers']),
      followings: serializer.fromJson<int>(json['followings']),
      posts: serializer.fromJson<int>(json['posts']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'name': serializer.toJson<String>(name),
      'profilePic': serializer.toJson<String>(profilePic),
      'bio': serializer.toJson<String>(bio),
      'account': serializer.toJson<String>(account),
      'followers': serializer.toJson<int>(followers),
      'followings': serializer.toJson<int>(followings),
      'posts': serializer.toJson<int>(posts),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserData copyWith(
          {String id,
          String username,
          String name,
          String profilePic,
          String bio,
          String account,
          int followers,
          int followings,
          int posts,
          DateTime createdAt,
          DateTime updatedAt}) =>
      UserData(
        id: id ?? this.id,
        username: username ?? this.username,
        name: name ?? this.name,
        profilePic: profilePic ?? this.profilePic,
        bio: bio ?? this.bio,
        account: account ?? this.account,
        followers: followers ?? this.followers,
        followings: followings ?? this.followings,
        posts: posts ?? this.posts,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('name: $name, ')
          ..write('profilePic: $profilePic, ')
          ..write('bio: $bio, ')
          ..write('account: $account, ')
          ..write('followers: $followers, ')
          ..write('followings: $followings, ')
          ..write('posts: $posts, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          username.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  profilePic.hashCode,
                  $mrjc(
                      bio.hashCode,
                      $mrjc(
                          account.hashCode,
                          $mrjc(
                              followers.hashCode,
                              $mrjc(
                                  followings.hashCode,
                                  $mrjc(
                                      posts.hashCode,
                                      $mrjc(createdAt.hashCode,
                                          updatedAt.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.username == this.username &&
          other.name == this.name &&
          other.profilePic == this.profilePic &&
          other.bio == this.bio &&
          other.account == this.account &&
          other.followers == this.followers &&
          other.followings == this.followings &&
          other.posts == this.posts &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> name;
  final Value<String> profilePic;
  final Value<String> bio;
  final Value<String> account;
  final Value<int> followers;
  final Value<int> followings;
  final Value<int> posts;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.name = const Value.absent(),
    this.profilePic = const Value.absent(),
    this.bio = const Value.absent(),
    this.account = const Value.absent(),
    this.followers = const Value.absent(),
    this.followings = const Value.absent(),
    this.posts = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserCompanion.insert({
    @required String id,
    @required String username,
    @required String name,
    @required String profilePic,
    this.bio = const Value.absent(),
    @required String account,
    @required int followers,
    @required int followings,
    @required int posts,
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : id = Value(id),
        username = Value(username),
        name = Value(name),
        profilePic = Value(profilePic),
        account = Value(account),
        followers = Value(followers),
        followings = Value(followings),
        posts = Value(posts),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserData> custom({
    Expression<String> id,
    Expression<String> username,
    Expression<String> name,
    Expression<String> profilePic,
    Expression<String> bio,
    Expression<String> account,
    Expression<int> followers,
    Expression<int> followings,
    Expression<int> posts,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (name != null) 'name': name,
      if (profilePic != null) 'profile_pic': profilePic,
      if (bio != null) 'bio': bio,
      if (account != null) 'account': account,
      if (followers != null) 'followers': followers,
      if (followings != null) 'followings': followings,
      if (posts != null) 'posts': posts,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserCompanion copyWith(
      {Value<String> id,
      Value<String> username,
      Value<String> name,
      Value<String> profilePic,
      Value<String> bio,
      Value<String> account,
      Value<int> followers,
      Value<int> followings,
      Value<int> posts,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return UserCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      bio: bio ?? this.bio,
      account: account ?? this.account,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
      posts: posts ?? this.posts,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (profilePic.present) {
      map['profile_pic'] = Variable<String>(profilePic.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (account.present) {
      map['account'] = Variable<String>(account.value);
    }
    if (followers.present) {
      map['followers'] = Variable<int>(followers.value);
    }
    if (followings.present) {
      map['followings'] = Variable<int>(followings.value);
    }
    if (posts.present) {
      map['posts'] = Variable<int>(posts.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('name: $name, ')
          ..write('profilePic: $profilePic, ')
          ..write('bio: $bio, ')
          ..write('account: $account, ')
          ..write('followers: $followers, ')
          ..write('followings: $followings, ')
          ..write('posts: $posts, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  @override
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn(
      'username',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _profilePicMeta = const VerificationMeta('profilePic');
  GeneratedTextColumn _profilePic;
  @override
  GeneratedTextColumn get profilePic => _profilePic ??= _constructProfilePic();
  GeneratedTextColumn _constructProfilePic() {
    return GeneratedTextColumn(
      'profile_pic',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bioMeta = const VerificationMeta('bio');
  GeneratedTextColumn _bio;
  @override
  GeneratedTextColumn get bio => _bio ??= _constructBio();
  GeneratedTextColumn _constructBio() {
    return GeneratedTextColumn(
      'bio',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  GeneratedTextColumn _account;
  @override
  GeneratedTextColumn get account => _account ??= _constructAccount();
  GeneratedTextColumn _constructAccount() {
    return GeneratedTextColumn(
      'account',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followersMeta = const VerificationMeta('followers');
  GeneratedIntColumn _followers;
  @override
  GeneratedIntColumn get followers => _followers ??= _constructFollowers();
  GeneratedIntColumn _constructFollowers() {
    return GeneratedIntColumn(
      'followers',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followingsMeta = const VerificationMeta('followings');
  GeneratedIntColumn _followings;
  @override
  GeneratedIntColumn get followings => _followings ??= _constructFollowings();
  GeneratedIntColumn _constructFollowings() {
    return GeneratedIntColumn(
      'followings',
      $tableName,
      false,
    );
  }

  final VerificationMeta _postsMeta = const VerificationMeta('posts');
  GeneratedIntColumn _posts;
  @override
  GeneratedIntColumn get posts => _posts ??= _constructPosts();
  GeneratedIntColumn _constructPosts() {
    return GeneratedIntColumn(
      'posts',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        name,
        profilePic,
        bio,
        account,
        followers,
        followings,
        posts,
        createdAt,
        updatedAt
      ];
  @override
  $UserTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user';
  @override
  final String actualTableName = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username'], _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('profile_pic')) {
      context.handle(
          _profilePicMeta,
          profilePic.isAcceptableOrUnknown(
              data['profile_pic'], _profilePicMeta));
    } else if (isInserting) {
      context.missing(_profilePicMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio'], _bioMeta));
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account'], _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('followers')) {
      context.handle(_followersMeta,
          followers.isAcceptableOrUnknown(data['followers'], _followersMeta));
    } else if (isInserting) {
      context.missing(_followersMeta);
    }
    if (data.containsKey('followings')) {
      context.handle(
          _followingsMeta,
          followings.isAcceptableOrUnknown(
              data['followings'], _followingsMeta));
    } else if (isInserting) {
      context.missing(_followingsMeta);
    }
    if (data.containsKey('posts')) {
      context.handle(
          _postsMeta, posts.isAcceptableOrUnknown(data['posts'], _postsMeta));
    } else if (isInserting) {
      context.missing(_postsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(_db, alias);
  }
}

class PostData extends DataClass implements Insertable<PostData> {
  final String id;
  final String caption;
  final String image;
  final int likes;
  final bool isLiked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userId;
  PostData(
      {@required this.id,
      @required this.caption,
      @required this.image,
      @required this.likes,
      @required this.isLiked,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.userId});
  factory PostData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PostData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      caption:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}caption']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      likes: intType.mapFromDatabaseResponse(data['${effectivePrefix}likes']),
      isLiked:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_liked']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      userId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || likes != null) {
      map['likes'] = Variable<int>(likes);
    }
    if (!nullToAbsent || isLiked != null) {
      map['is_liked'] = Variable<bool>(isLiked);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    return map;
  }

  factory PostData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PostData(
      id: serializer.fromJson<String>(json['_id']),
      caption: serializer.fromJson<String>(json['caption']),
      image: serializer.fromJson<String>(json['image']),
      likes: serializer.fromJson<int>(json['likes']),
      isLiked: serializer.fromJson<bool>(json['isLiked']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      userId: serializer.fromJson<String>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'caption': serializer.toJson<String>(caption),
      'image': serializer.toJson<String>(image),
      'likes': serializer.toJson<int>(likes),
      'isLiked': serializer.toJson<bool>(isLiked),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'user': serializer.toJson<String>(userId),
    };
  }

  PostData copyWith(
          {String id,
          String caption,
          String image,
          int likes,
          bool isLiked,
          DateTime createdAt,
          DateTime updatedAt,
          String userId}) =>
      PostData(
        id: id ?? this.id,
        caption: caption ?? this.caption,
        image: image ?? this.image,
        likes: likes ?? this.likes,
        isLiked: isLiked ?? this.isLiked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('PostData(')
          ..write('id: $id, ')
          ..write('caption: $caption, ')
          ..write('image: $image, ')
          ..write('likes: $likes, ')
          ..write('isLiked: $isLiked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          caption.hashCode,
          $mrjc(
              image.hashCode,
              $mrjc(
                  likes.hashCode,
                  $mrjc(
                      isLiked.hashCode,
                      $mrjc(createdAt.hashCode,
                          $mrjc(updatedAt.hashCode, userId.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PostData &&
          other.id == this.id &&
          other.caption == this.caption &&
          other.image == this.image &&
          other.likes == this.likes &&
          other.isLiked == this.isLiked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.userId == this.userId);
}

class PostCompanion extends UpdateCompanion<PostData> {
  final Value<String> id;
  final Value<String> caption;
  final Value<String> image;
  final Value<int> likes;
  final Value<bool> isLiked;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> userId;
  const PostCompanion({
    this.id = const Value.absent(),
    this.caption = const Value.absent(),
    this.image = const Value.absent(),
    this.likes = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.userId = const Value.absent(),
  });
  PostCompanion.insert({
    @required String id,
    @required String caption,
    @required String image,
    @required int likes,
    @required bool isLiked,
    @required DateTime createdAt,
    @required DateTime updatedAt,
    @required String userId,
  })  : id = Value(id),
        caption = Value(caption),
        image = Value(image),
        likes = Value(likes),
        isLiked = Value(isLiked),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        userId = Value(userId);
  static Insertable<PostData> custom({
    Expression<String> id,
    Expression<String> caption,
    Expression<String> image,
    Expression<int> likes,
    Expression<bool> isLiked,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
    Expression<String> userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caption != null) 'caption': caption,
      if (image != null) 'image': image,
      if (likes != null) 'likes': likes,
      if (isLiked != null) 'is_liked': isLiked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (userId != null) 'user_id': userId,
    });
  }

  PostCompanion copyWith(
      {Value<String> id,
      Value<String> caption,
      Value<String> image,
      Value<int> likes,
      Value<bool> isLiked,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> userId}) {
    return PostCompanion(
      id: id ?? this.id,
      caption: caption ?? this.caption,
      image: image ?? this.image,
      likes: likes ?? this.likes,
      isLiked: isLiked ?? this.isLiked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (isLiked.present) {
      map['is_liked'] = Variable<bool>(isLiked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostCompanion(')
          ..write('id: $id, ')
          ..write('caption: $caption, ')
          ..write('image: $image, ')
          ..write('likes: $likes, ')
          ..write('isLiked: $isLiked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $PostTable extends Post with TableInfo<$PostTable, PostData> {
  final String _alias;
  GeneratedTextColumn _caption;
  final VerificationMeta _captionMeta = const VerificationMeta('caption');
  GeneratedDateTimeColumn _createdAt;
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  final GeneratedDatabase _db;
  GeneratedTextColumn _id;
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _image;
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedBoolColumn _isLiked;
  final VerificationMeta _isLikedMeta = const VerificationMeta('isLiked');
  GeneratedIntColumn _likes;
  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  GeneratedDateTimeColumn _updatedAt;
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _userId;
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');

  $PostTable(this._db, [this._alias]);

  @override
  List<GeneratedColumn> get $columns =>
      [id, caption, image, likes, isLiked, createdAt, updatedAt, userId];

  @override
  $PostTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'post';

  @override
  final String actualTableName = 'post';

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  GeneratedTextColumn get caption => _caption ??= _constructCaption();

  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();

  @override
  GeneratedTextColumn get id => _id ??= _constructId();

  @override
  GeneratedTextColumn get image => _image ??= _constructImage();

  @override
  GeneratedBoolColumn get isLiked => _isLiked ??= _constructIsLiked();

  @override
  GeneratedIntColumn get likes => _likes ??= _constructLikes();

  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();

  @override
  GeneratedTextColumn get userId => _userId ??= _constructUserId();

  @override
  $PostTable createAlias(String alias) {
    return $PostTable(_db, alias);
  }

  @override
  PostData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PostData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  VerificationContext validateIntegrity(Insertable<PostData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('caption')) {
      context.handle(_captionMeta,
          caption.isAcceptableOrUnknown(data['caption'], _captionMeta));
    } else if (isInserting) {
      context.missing(_captionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes'], _likesMeta));
    } else if (isInserting) {
      context.missing(_likesMeta);
    }
    if (data.containsKey('is_liked')) {
      context.handle(_isLikedMeta,
          isLiked.isAcceptableOrUnknown(data['is_liked'], _isLikedMeta));
    } else if (isInserting) {
      context.missing(_isLikedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  GeneratedTextColumn _constructCaption() {
    return GeneratedTextColumn(
      'caption',
      $tableName,
      false,
    );
  }

  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  GeneratedIntColumn _constructLikes() {
    return GeneratedIntColumn(
      'likes',
      $tableName,
      false,
    );
  }

  GeneratedBoolColumn _constructIsLiked() {
    return GeneratedBoolColumn(
      'is_liked',
      $tableName,
      false,
    );
  }

  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  GeneratedTextColumn _constructUserId() {
    return GeneratedTextColumn(
      'user_id',
      $tableName,
      false,
    );
  }
}

abstract class _$MoorDatabase extends GeneratedDatabase {
  MoorPostDao _moorPostDao;
  $PostTable _post;
  $UserTable _user;

  _$MoorDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, post];

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  $UserTable get user => _user ??= $UserTable(this);

  $PostTable get post => _post ??= $PostTable(this);

  MoorPostDao get moorPostDao =>
      _moorPostDao ??= MoorPostDao(db: this as MoorDatabase);
}
