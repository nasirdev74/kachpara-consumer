import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, Timestamp?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    if (json == null) {
      return null;
    }
    return json.toDate();
  }

  @override
  Timestamp? toJson(DateTime? object) {
    if (object == null) {
      return null;
    }
    return Timestamp.fromDate(object);
  }
}
