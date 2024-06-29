import 'package:intl/intl.dart';

extension DateToString on DateTime {
  String toDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toTime() {
    return DateFormat('hh:mm a').format(this);
  }

  String customFormat() => '${toDate()} ${toTime()}';
}
