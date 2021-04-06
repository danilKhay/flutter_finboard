import 'package:intl/intl.dart';

extension UnixString on DateTime {
  String toUnixString() {
    return (this.toUtc().millisecondsSinceEpoch/1000).round().toString();
  }

  String toFinnHubString() {
    final utc = this.toUtc();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(utc);
  }
}