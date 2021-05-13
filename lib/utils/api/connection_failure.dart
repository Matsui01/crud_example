import 'package:crud_example/utils/widget/my_snack.dart';

import 'api.dart';

class ConnectionFailure {
  static Future<ResponseModel> onFailRequest(
    ResponseModel responseModel,
    String url, [
    bool canRefresh = true,
    bool hasLocalData = false,
  ]) async {
    print("On Fail Request Started");
    print("CanRefresh: $canRefresh");
    print("responseModel.code: ${responseModel.code}");

    if (responseModel.code == 401 && canRefresh) {
      print("Erro de autorização iniciado");

      bool refreshed = await AuthRefresh.refreshToken();

      print("Status do refresh token: $refreshed");

      if (refreshed) {
        responseModel.connectionResultType = ConnectionResultType.REFRESH_SUCCESS;

        return responseModel;
      }
    }

    print("Não funcionou o refresh");
    // responseModel.connectionResultType = _getgesultType(responseModel.code);
    // DeviceFeatureChecker.verifyConnection(url, responseModel.code, responseModel.responseBody);

    try {
      if (hasLocalData) {
        dynamic loadedLocalBody = await LocalDataChecker.verifyLocalData(url);
        if (loadedLocalBody["body"] != null) {
          String date = loadedLocalBody["date"];
          return ResponseModel(
            code: 200,
            connectionResultType: ConnectionResultType.LOCAL_DATA,
            body: loadedLocalBody["body"],
            errorMessages: [date],
          );
        }
      }
    } catch (e) {
      print("Erro ao fazer a verificação de conexão e a verificação de local data $e");
    }

    try {
      if (responseModel.body != null) {
        // listError = responseModel.responseBody.values.toList();
        responseModel.errorMessages = _getErrorMessages(responseModel.body);
      } else {
        switch (responseModel.code) {
          case 400:
            responseModel.errorMessages.add("Server Error");
            break;
          default:
            responseModel.errorMessages.add("Server Error");
        }
      }
    } catch (e) {
      print("Erro ao adicionar mensagens de erro $e");
    }

    //---------------------Codigo do Nap-------------------------
    // if (userMapFromJson['error'] == "WRONG_CREDENTIALS") {
    //   print("## Erro WRONG_CREDENTIALS LoginAction (Login Controller)");
    //   MySnack.showSnack(userMapFromJson['message'], scaffoldKey, true);
    //   return null;
    // } else if (userMapFromJson['error'] == "EMAIL_NOT_VERIFIED") {
    //   return userMapFromJson;
    // }
    //---------------------Codigo do Nap-------------------------

    print(responseModel.connectionResultType);
    return responseModel;
  }

  static List<String> _getErrorMessages(Map map) {
    List<String> errorMessages = List<String>();
    //  Se o primeiro item for uma string ou uma lista
    // {"mensagemDeErro": "falta de parametros"}
    // {"mensagemDeErro": ["falta de parametros", "Nome errado"]}
    // print("listError.length ${listError.length}");
    // print("listError.0 ${listError[0]}");
    // print("listError[0].runtimeType ${listError[0].runtimeType}");
    // print("listError.1 ${listError[1]}");
    errorMessages.add(map["message"]);
    return errorMessages;
    // switch (listError[0].runtimeType) {
    //   case List:
    //     for (var item in listError[0]) {
    //       errorMessages.add(item);
    //     }
    //     break;
    //   case String:
    //     errorMessages.add(listError[0]);
    //     break;
    //   default:
    //     errorMessages.add(listError[0].toString());
    // }
  }

  static void feedbackError(GlobalKey<ScaffoldState> scaffoldKey, ResponseModel responseModel) async {
    if (responseModel.errorMessages == null) return;
    for (int i = 0; i < responseModel.errorMessages.length; i++) {
      String message = responseModel.errorMessages[i];

      MySnack.showSnack(message, scaffoldKey, true, 2);

      await Future.delayed(Duration(seconds: 2));
    }
  }
}
