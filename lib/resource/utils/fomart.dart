import 'package:intl/intl.dart';

class FomartUtils {
  static String? formatMoney(int value) {
    return NumberFormat.decimalPattern().format(value);
  }
}
