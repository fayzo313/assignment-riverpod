import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toReadableDate(String localeCode) =>
      DateFormat('EEE, dd MMM', localeCode).format(this);

  String toShortDateTime(String localeCode) =>
      DateFormat('dd MMM • HH:mm', localeCode).format(this);
}
