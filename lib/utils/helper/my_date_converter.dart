class MyDateConverter {
  static DateTime convert(String str) {
    List dateList = str.split(" ");
    int day = int.parse(dateList[2]);
    int month = getMonth(dateList[1]);
    int year = int.parse(dateList[5]);
    int h = int.parse(dateList[3].split(":")[0]);
    int m = int.parse(dateList[3].split(":")[1]);
    int s = int.parse(dateList[3].split(":")[2]);

    return DateTime(year, month, day, h, m, s);
  }

  static int getMonth(String month) {
    switch (month) {
      case "Jan":
        return 1;
      case "Feb":
        return 2;
      case "Mar":
        return 3;
      case "Apr":
        return 4;
      case "May":
        return 5;
      case "Jun":
        return 6;
      case "Jul":
        return 7;
      case "Aug":
        return 8;
      case "Sep":
        return 9;
      case "Oct":
        return 10;
      case "Nov":
        return 11;
      case "Dec":
        return 12;
      default:
        return 1;
    }
  }
}
