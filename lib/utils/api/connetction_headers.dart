

import 'package:crud_example/utils/api/api.dart';

class ConnectionHeaders {
  final String tokenBody = "refresh_token";

  ///Header Type - `HeaderType.JSON_HEADER`
  ///Header Type - `HeaderType.AUTH_TOKEN`
  static Map<String, String> setHeaders({HeaderType headerType}) {
    //TODO: DESCOMENTAR
    // if (headerType == null) headerType = HeaderType.JSON_HEADER;
    // Authentication authentication = Authentication();
    // switch (headerType) {
    //   case HeaderType.JSON_HEADER:
    //     return {"Content-type": "application/json"};
    //     break;
    //   case HeaderType.ACCESS_TOKEN:
    //     return {
    //       "Content-type": "application/json",
    //       "Authorization": "${authentication.authModel.tokenType} ${authentication.authModel.acessToken}"
    //     };
    //     break;
    //   case HeaderType.REFRESH_TOKEN:
    //     return {
    //       "Content-type": "application/json",
    //       "Authorization": "${authentication.authModel.tokenType} ${authentication.authModel.refreshToken}"
    //     };
    //     break;
    //   default:
    //     return {"Content-type": "application/json"};
    // }
  }
}
