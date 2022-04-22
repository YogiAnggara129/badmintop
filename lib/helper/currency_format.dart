import 'package:intl/intl.dart';

// sumber: https://galangaji.medium.com/5-flutter-tutorial-cara-mudah-format-rupiah-pada-dart-c1711621e648
class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}