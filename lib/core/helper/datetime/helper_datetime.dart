import 'package:intl/intl.dart';

class HelperDatetime {
  HelperDatetime._();

  static DateFormat get apiDateFormat2 => DateFormat('yyyy-MM-dd HH:mm:ss');
  static DateFormat get apiDateFormat => DateFormat('yyyy-MM-ddTHH:mm:ss');
  static DateFormat get apiTimeFormat => DateFormat('HH:mm:ss');
  static DateFormat get apiTimeFormatHHMM => DateFormat('HH:mm');
  static DateFormat get apiOnlyDateFormat => DateFormat('yyyy-MM-ddT00:00:00');
  static DateFormat get dateHourFormat => DateFormat('dd/MM/yyyy  HH:mm');
  static DateFormat get dateFormat => DateFormat('dd/MM/yyyy');
  static DateFormat get dateFormatMMYY => DateFormat('MM/yyyy');
  static DateFormat get yearMonthDay => DateFormat('yyyy-MM-dd');
  static DateFormat get monthYearFormat => DateFormat('MMMM yyyy');
  static DateFormat get dateFormatSeparated => DateFormat('dd MMMM yyyy');
  static DateFormat get dateDayOfWeekFormatSeparated =>
      DateFormat('EEEE dd/MM/yyyy');
  static DateFormat get dateDay => DateFormat('EEEE');

  static String formatTime(String time, {bool withSeconds = false}) {
    String timeString = time
        .substring(0, time.length > 8 ? 8 : time.length)
        .replaceAll('PT', '')
        .replaceAll('H', ':')
        .replaceAll('S', '')
        .replaceAll('M', '');
    if (timeString.endsWith(':')) {
      timeString = '${timeString}00';
    }
    if (withSeconds && timeString.length <= 5) {
      timeString = '$timeString:00';
    }
    if (timeString != '0') {
      return timeString;
    }
    return '';
  }

  static String formatDate(DateTime time, DateFormat format) =>
      format.format(time);

  static DateTime formatDateTime(DateTime time, DateFormat format) =>
      DateTime.parse(format.format(time));

  static String formatTimestamp(int time, DateFormat format) {
    if (time == 0) {
      return '--';
    }
    final time0 = DateTime.fromMillisecondsSinceEpoch(time);
    return format.format(time0);
  }
}
