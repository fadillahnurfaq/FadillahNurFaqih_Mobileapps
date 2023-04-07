import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic price, int decimalDigit,
      {String? symbol}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: "id",
      symbol: symbol ?? "Rp ",
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(price);
  }
}
