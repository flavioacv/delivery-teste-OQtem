import 'package:intl/intl.dart';

class DateStringFormatters {
  static String formatDateString(String string) {
    String data = string;
    final dateTime = DateTime.parse(data);
    final date = DateFormat('dd/MM/yyyy').format(dateTime);
    return date;
  }

  static String formatHours(dynamic string) {
    String data = string;
    final dateTime = DateTime.parse(data);
    final date = DateFormat('HH:mm').format(dateTime);
    return date.toString();
  }
}
