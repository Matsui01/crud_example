class Conversor {
  static String priceConverter(int preco) {
    double precoRight = preco / 100;
    String value = precoRight.toString();
    int valorBruto = precoRight.toInt();
    double valorQuebrado = precoRight - valorBruto;

    if (valorQuebrado <= 9) {
      value = "${value}0";
    }
    String valueAux = '';
    for (var i = 0; i < value.length; i++) {
      if (value[i] == '.') {
        valueAux = "$valueAux,";
      } else {
        valueAux = "$valueAux${value[i]}";
      }
    }
    
    value = valueAux;
    return value;
  }

  static String timeConverter(DateTime dateTime){
    int hora = dateTime.hour;
    int minute = dateTime.minute;
    return "$hora:$minute";
  }
}
