import 'package:easy_money_formatter/easy_money_formatter.dart';

void main() {
  final amount = 1234567;

  print(amount.toMoney()); // Output: 1,234,567.00
  print(amount.toShortMoney()); // Output: 1.2M
  print(amount.toCurrency(symbol: '€')); // Output: €1,234,567.00
  print(amount.toLocalizedMoney('en_IN')); // Output: 12,34,567
  print(amount.toScientific()); // Output: 1.23e6
}
