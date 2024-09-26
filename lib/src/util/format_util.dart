import 'package:intl/intl.dart';

class TimeStamp {
  static String timeStampParse(String timestamp) {
    int timestampData = int.parse(timestamp);
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestampData);
    String formatDay = DateFormat.yMMMd().format(date);
    return formatDay;
  }
}
