import 'package:meta/meta.dart';

typedef Constructor<T> = T Function(dynamic json);

class Paginated<T> {
  final List<T> docs;
  final PaginatedMetaData meta;

  Paginated({@required this.docs, @required this.meta});

  factory Paginated.fromJson(
    Map<String, dynamic> map,
    Constructor<T> constructor,
  ) {
    if (map == null || constructor == null) return null;

    return Paginated<T>(
      docs: List<T>.from(map['docs']?.map(constructor)),
      meta: PaginatedMetaData.fromJson(map),
    );
  }

  @override
  String toString() => 'Paginated(docs: $docs, meta: $meta)';

  Paginated<T> copyWith({
    List<T> docs,
    PaginatedMetaData meta,
  }) {
    return Paginated<T>(
      docs: List<T>.from(this.docs)..addAll(docs),
      meta: meta ?? this.meta,
    );
  }
}

class PaginatedMetaData {
  final int limit;
  final int page;
  final int pages;
  final int total;

  factory PaginatedMetaData.empty() => PaginatedMetaData(
        total: 0,
        limit: 0,
        page: 0,
        pages: 0,
      );

  factory PaginatedMetaData.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json == null) {
      return null;
    }
    return PaginatedMetaData(
      total: json["total"],
      limit: json["limit"],
      page: json["page"] is String ? int.parse(json["page"]) : json["page"],
      pages: json["pages"],
    );
  }

  @override
  String toString() {
    return 'PaginatedData(total: $total, limit: $limit, page: $page, pages: $pages)';
  }

  bool get hasMorePages => page == 0 || page < pages;

  int get nextPage => page + 1;

  PaginatedMetaData({
    this.total,
    this.limit,
    this.page,
    this.pages,
  });

  PaginatedMetaData copyWith({
    int total,
    int limit,
    String page,
    int pages,
  }) {
    return PaginatedMetaData(
      total: total ?? this.total,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      pages: pages ?? this.pages,
    );
  }
}
