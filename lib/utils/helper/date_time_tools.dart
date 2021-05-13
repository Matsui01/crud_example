class DateTimeTools {
  static String dateToString(DateTime _dateTime) {
    String day = _dateTime.day.toString();
    String month = _dateTime.month.toString();
    String year = _dateTime.year.toString();

    if (_dateTime.day < 10) {
      day = '0$day';
    }
    if (_dateTime.month < 10) {
      month = '0$month';
    }

    String date = "$day/$month/${year.substring(0,4)}";
    return date;
  }

  static String dateToStringHour(DateTime _dateTime) {
    String hour = _dateTime.hour.toString();
    String minutes = _dateTime.minute.toString();
    if (_dateTime.minute == 0) {
      minutes = '00';
    }
    return "$hour:$minutes";
  }

  static String durationToString(Duration _duration) {
    String duration = _duration.toString();
    if (duration[1] == ':') {
      return "0${duration.substring(0, 4)}";
    } else {
      return duration.substring(0, 5);
    }
  }
}
