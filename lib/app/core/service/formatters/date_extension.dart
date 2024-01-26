//import 'package:intl/intl.dart';

// extension DateExtension on DateTime {
//   String get toDateDDMMYYString => DateFormat('dd/MM/yyyy').format(this);
//   String get toTimeHM => DateFormat('HH:mm').format(this);
//   String get formatToUsaString => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
// }

extension StringExtensions on String {
  String capitalize() {
    var str = split(' ');
    var stringFinal = '';
    for (var element in str) {
      stringFinal =
          "$stringFinal${element[0].toUpperCase()}${element.substring(1).toLowerCase()} ";
    }
    return stringFinal;
  }
}
