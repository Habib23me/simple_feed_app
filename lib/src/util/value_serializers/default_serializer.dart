import 'package:moor_flutter/moor_flutter.dart';

class DefaultValueSerializer extends ValueSerializer {
  const DefaultValueSerializer();

  @override
  T fromJson<T>(dynamic json) {
    if (json == null) {
      return null;
    }

    if (T == DateTime) {
      return DateTime.parse(json as String).toLocal() as T;
    }

    if (T == double && json is int) {
      return json.toDouble() as T;
    }

    // blobs are encoded as a regular json array, so we manually convert that to
    // a Uint8List
    if (T == Uint8List && json is! Uint8List) {
      final asList = (json as List).cast<int>();
      return Uint8List.fromList(asList) as T;
    }

    if (T == String && json is Map) {
      return json["_id"] as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.toUtc().toIso8601String();
    }

    return value;
  }
}
