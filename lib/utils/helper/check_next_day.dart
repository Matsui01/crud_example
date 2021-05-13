



import 'package:crud_example/utils/helper/helper.dart';

class CheckNextDay {
  bool _isNextday;

  bool getIsNextday() {
    // int i = 0;
    // while (_isNextday == null) {
    //   await Future.delayed(Duration(milliseconds: 300));
    //   i++;
    //   if (i > 8) return true;
    // }
    return _isNextday;
  }

  //isso pode rodar só 1 vez
  Future initCheckNextDay() async {
    _isNextday = await _check();
    print("initCheckNextDay = $_isNextday");
    return _isNextday;
  }

  Future<bool> _check() async {
    Map loadedMap = await MyIo.load("CurrentDate");

    MyIo.save("CurrentDate", {
      "DateTime": DateTime.now().toString(),
    });

    if (loadedMap == null) return true;

    String stringDate = loadedMap["DateTime"];

    DateTime dateTime = DateTime.parse(stringDate);

    DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);

    DateTime dateNow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    print("NEXT DAY = ${date != dateNow}");

    return date != dateNow;
  }
}
