class OrdinalNumber {
  ///Feminino ["f"] Masculono ["m"]
  static String toOrdinal(int number, bool masculino) {
    switch (number) {
      case 1:
        return "primeir${masculino ? "o" : "a"}";
      case 2:
        return "segund${masculino ? "o" : "a"}";
      case 3:
        return "terceir${masculino ? "o" : "a"}";
      case 4:
        return "quart${masculino ? "o" : "a"}";
      case 5:
        return "quint${masculino ? "o" : "a"}";
      case 6:
        return "sext${masculino ? "o" : "a"}";
      case 7:
        return "sétim${masculino ? "o" : "a"}";
      case 8:
        return "oitav${masculino ? "o" : "a"}";
      case 9:
        return "non${masculino ? "o" : "a"}";
      case 10:
        return "décim${masculino ? "o" : "a"}";
      default:
        return number.toString();
    }
  }
}
