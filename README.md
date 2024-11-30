# Money Formatter 🌟

[![Pub Version](https://img.shields.io/pub/v/easy_money_formatter)](https://pub.dev/packages/easy_money_formatter)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`easy_money_formatter` is a lightweight Dart package that simplifies formatting numbers into human-readable money formats. Whether you're building a finance app, e-commerce platform, or any project that deals with numbers, `easy_money_formatter` has got you covered! 💰

---

## Features ✨

- Format numbers with separators (comma, dot, or custom).
- Abbreviated formats like `1.5K`, `2M`, `1B`.
- Localized formats for US, Europe, India, and more.
- Add custom currency symbols like `$`, `€`, `₹`.
- Scientific notation support (e.g., `1.0e6`).

---

## Installation 📦

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  easy_money_formatter: ^1.0.0
```
## Usage 🚀

```dart
import 'package:easy_money_formatter/easy_money_formatter.dart';
```
## Examples 🎯
1. **Format with separators**
```dart
final amount = 1234567;

print(amount.toMoney()); // Output: 1,234,567.00
print(amount.toMoney(separator: '.')); // Output: 1.234.567.00
```
2. **Abbreviated formats**
```dart
print(amount.toShortMoney()); // Output: 1.23M
print(1500.toShortMoney()); // Output: 1.5K
```
3. **Add currency symbols**
```dart
print(amount.toCurrency(symbol: '\$')); // Output: $1,234,567.00
print(amount.toCurrency(symbol: '€', separator: '.')); // Output: €1.234.567.00
```
4. **Localized formats**
```dart
print(amount.toLocalizedMoney('en_IN')); // Output: 12,34,567
print(amount.toLocalizedMoney('de_DE')); // Output: 1.234.567
```
5. **Scientific notation**
```dart
print(amount.toScientific()); // Output: 1.23e6
print(1000000.toScientific()); // Output: 1.0e6
```

## API 📚

| Method | Description | Parameters | Default |
| --- | --- | --- | --- |
| `toMoney` | Formats number with separators | `separator` | `,` |
| `toShortMoney` | Formats number in abbreviated format | - | - |
| `toCurrency` | Formats number with currency symbol | `symbol`, `separator` | `$`, `,` |
| `toLocalizedMoney` | Formats number in localized format | `locale` | `en_US` |
| `toScientific` | Formats number in scientific notation | - | - |


## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

