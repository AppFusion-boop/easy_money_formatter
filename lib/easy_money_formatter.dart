library money_formatter;

extension MoneyFormatter on num {
  /// Formats the number as a money string with a separator (comma/dot).
  String toMoney({
    String separator = ',',
    int precision = 2,
  }) {
    final numberString = toStringAsFixed(precision);
    final parts = numberString.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
    final buffer = StringBuffer();

    for (int i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) {
        buffer.write(separator);
      }
      buffer.write(integerPart[i]);
    }

    return buffer.toString() + decimalPart;
  }

  /// Formats the number in short form (e.g., 1.5K, 2M, 1B).
  String toShortMoney({int precision = 1}) {
    if (this >= 1000000000) {
      return "${(this / 1000000000).toStringAsFixed(precision)}B";
    }
    if (this >= 1000000) {
      return "${(this / 1000000).toStringAsFixed(precision)}M";
    }
    if (this >= 1000) return "${(this / 1000).toStringAsFixed(precision)}K";
    return toStringAsFixed(precision);
  }

  /// Formats the number with a currency symbol.
  String toCurrency({
    String symbol = '\$',
    String separator = ',',
    int precision = 2,
  }) {
    return "$symbol${toMoney(separator: separator, precision: precision)}";
  }

  /// Formats the number in a localized format (e.g., 10,00,000 for India).
  String toLocalizedMoney(String locale) {
    switch (locale) {
      case 'en_IN':
        return _toIndianFormat();
      case 'de_DE':
        return toMoney(separator: '.');
      case 'en_US':
      default:
        return toMoney(separator: ',');
    }
  }

  /// Converts the number to scientific notation (e.g., 1.0e6).
  String toScientific({int precision = 2}) {
    return toStringAsExponential(precision);
  }

  /// Internal helper for Indian number formatting.
  String _toIndianFormat() {
    final str = toStringAsFixed(0);
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 &&
          ((str.length - i > 3 && (str.length - i - 3) % 2 == 0) ||
              (str.length - i <= 3 && (str.length - i) % 3 == 0))) {
        buffer.write(',');
      }
      buffer.write(str[i]);
    }
    return buffer.toString();
  }
}
