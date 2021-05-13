
import 'package:crud_example/utils/helper/my_io.dart';

class LocalDataChecker {
  static Future verifyLocalData(String url) async {
    // int index = url.indexOf(".br");
    // if (index == -1) return null;
    // index += 3;
    // String key = url.substring(index);
     String key = url;
    dynamic body = await MyIo.load(key);
    print(
        "informações sendo Carregadas: Key:$key, date: ${body["date"]}, Body: ${body["body"].toString().substring(0, 50)}....");
    return body;
  }

  static Future saveLocalData(String url, dynamic body, [bool dontUseOnlyBody = true]) async {
    print("Save local sendo chamado! ");
    // int index = url.indexOf(".br");
    // if (index == -1) return false;
    // index += 3;
    // String key = url.substring(index);
    String key = url;
    Map saveBody = {
      "body": body,
      "date": DateTime.now().toString(),
    };
    bool result = await MyIo.save(key, dontUseOnlyBody ? saveBody : body);
    try {
      print(
          "informações sendo salvas: Key:$key, date: ${saveBody["date"]}, Body: ${body.toString().substring(0, 50)}....");
    } catch (e) {
      print("erro ao printar informações sendo salvas $e");
    }
    return result;
  }
}
