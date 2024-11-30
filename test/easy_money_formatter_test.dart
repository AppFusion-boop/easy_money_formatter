import 'package:easy_money_formatter/easy_money_formatter.dart';
import 'package:test/test.dart';

void main() {
  test('toMoney formats with commas', () {
    expect(1000000.toMoney(), '1,000,000.00');
  });

  test('toShortMoney formats to short form', () {
    expect(1500.toShortMoney(), '1.5K');
    expect(2000000.toShortMoney(), '2.0M');
  });

  test('toCurrency adds currency symbol', () {
    expect(1000.toCurrency(symbol: '€'), '€1,000.00');
  });

  test('toLocalizedMoney handles locales', () {
    expect(1000000.toLocalizedMoney('en_IN'), '10,00,000');
    expect(1000000.toLocalizedMoney('de_DE'), '1.000.000.00');
  });

  test('toScientific formats to scientific notation', () {
    expect(1000000.toScientific(), '1.00e+6');
  });
}
