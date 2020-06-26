import 'package:flutter/foundation.dart';

@immutable
class UpdateResult {
  const UpdateResult({this.modified});

  final int modified;

  factory UpdateResult.fromJson(Map<String, Object> json) {
    return UpdateResult(
      modified: json['modified'],
    );
  }
}
