extension MoneyFormatter on num {
  /// Formats the number as a money string with a separator (comma/dot).
  String toMoney({
    String separator = ',',
    int precision = 2,
  }) {
    final isNegative = this < 0;
    final absValue = this.abs();
    final numberString = absValue.toStringAsFixed(precision);
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

    final formatted = buffer.toString() + decimalPart;
    return isNegative ? '-$formatted' : formatted;
  }

  /// Formats the number in short form (e.g., 1.5K, 2M, 1B).
  String toShortMoney({int precision = 1}) {
    final isNegative = this < 0;
    final absValue = this.abs();
    String result;
    if (absValue >= 1000000000) {
      result = "${(absValue / 1000000000).toStringAsFixed(precision)}B";
    } else if (absValue >= 1000000) {
      result = "${(absValue / 1000000).toStringAsFixed(precision)}M";
    } else if (absValue >= 1000) {
      result = "${(absValue / 1000).toStringAsFixed(precision)}K";
    } else {
      result = absValue.toStringAsFixed(precision);
    }
    return isNegative ? '-$result' : result;
  }

  /// Formats the number with a currency symbol.
  String toCurrency({
    String symbol = '\$',
    String separator = ',',
    int precision = 2,
  }) {
    // The negative sign is handled in toMoney.
    return "$symbol${toMoney(separator: separator, precision: precision)}";
  }

  /// Formats the number in a localized format (e.g., 10,00,000 for India).
  String toLocalizedMoney(String locale) {
    final isNegative = this < 0;
    final absValue = this.abs();
    String formatted;
    switch (locale) {
      case 'en_IN':
        formatted = absValue._toIndianFormat();
        break;
      case 'de_DE':
        formatted = absValue.toMoney(separator: '.');
        break;
      case 'en_US':
      default:
        formatted = absValue.toMoney(separator: ',');
        break;
    }
    return isNegative ? '-$formatted' : formatted;
  }

  /// Converts the number to scientific notation (e.g., 1.0e6).
  String toScientific({int precision = 2}) {
    // Scientific notation formatting works fine for negative numbers.
    return toStringAsExponential(precision);
  }

  /// Internal helper for Indian number formatting.
  String _toIndianFormat() {
    final isNegative = this < 0;
    final absValue = this.abs();
    final str = absValue.toStringAsFixed(0);
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 &&
          ((str.length - i > 3 && (str.length - i - 3) % 2 == 0) ||
              (str.length - i <= 3 && (str.length - i) % 3 == 0))) {
        buffer.write(',');
      }
      buffer.write(str[i]);
    }
    final result = buffer.toString();
    return isNegative ? '-$result' : result;
  }
}
