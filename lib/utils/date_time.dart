// 08 Red 2023
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate {
    return DateFormat('dd MMM yyyy').format(this);
  }
}
