
class MoneyValue {
  static int getCents(String value) {
    int somatoria = 0;
    print("Valor transformado em centavos: $value");

    // divide o R$, e a virgola
    print("value $value");
    value = value.replaceAll(new RegExp(r"\s+"), "");
    print("value $value");
    List<String> separate = value.split(RegExp(r"[,|\s\$]"));
    print("separate $separate");
    // Remove o R$
    separate.removeAt(0);
    // remove qualquer espaço que haja na String do valor
    String trimResult = separate[0].trim();
    print("trimResult $trimResult");
    // remove os pontos do valor
    trimResult = trimResult.replaceAll(RegExp(r'\.'), '');
    print("trimResult $trimResult");
    // transforma o valor em numero
    int valorBruto = int.parse(trimResult);
    print("valorBruto $valorBruto");
    // Transforma em centavos
    somatoria += (valorBruto * 100);
    print("somatoria $somatoria");
    // Soma com os centavos do valor inicial
    somatoria += int.parse(separate[1]);
    print("somatoria1 $somatoria");
    // Retorna o resultado
    return somatoria;
  }
}
