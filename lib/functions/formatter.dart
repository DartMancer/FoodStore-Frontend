import 'package:intl/intl.dart';

class FormattingNumbers {
  FormattingNumbers({
    required this.myNumber,
  });

  final dynamic myNumber;

  formatNumber() {
    String stringNumber = myNumber.toString();
    double doubleNumber = double.tryParse(stringNumber) ?? 0;
    NumberFormat numberFormat = NumberFormat.compact();
    return numberFormat.format(doubleNumber);
  }
}

class FormattingDates {
  FormattingDates({required this.date});

  final DateTime date;

  String formatDate() {
    String formattedDate = DateFormat('dd.MM.yyyy', 'ru_RU').format(date);
    return formattedDate;
  }
}
