class NoSpace {
  static String pullSpace(String text, [bool startEnd = false]) {
    try {
      String resultString = "";
      List<String> newText = List<String>();
      newText = text.split(" ");
      for (var i = 0; i < newText.length; i++) {
        resultString = "$resultString${newText[i]}";
      }
      return resultString;
    } catch (e) {
      print("Ocorreu um erro al retirar espaçamento $e");
      return text;
    }
  }

  static String pullLastSpace(String text) {
    if (text[text.length - 1] == " ") {
      print("Tem sim ${text.substring(0, text.length -1)}");
      return text.substring(0, text.length -1);
    }
    return text;
  }

  static bool checkSpace(String text) {
    for (var i = 0; i < text.length; i++) {
      if (text[i] == " ") {
        return true;
      }
    }
    return false;
  }
}
