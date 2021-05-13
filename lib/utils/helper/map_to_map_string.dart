class MapToMapString {
  static Map<String, String> toMapString(map) {
    Map<String, String> mapString = Map<String, String>();
    
    List listDoMap = map.values.toList();
    
    List listk = map.keys.toList();

    for (var i = 0; i < listDoMap.length; i++) {
      Map<String, String> item = {listk[i]: listDoMap[i].toString()};
    
      mapString.addAll(item);
    }

    return mapString;
  }
}
