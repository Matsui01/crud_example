import 'package:crud_example/utils/auth/auth_model.dart';


class AuthRefresh {
  static Future<bool> refreshToken() async {
    // Authentication authentication = Authentication();

    // AuthModel authModel = await _tryRefresh(authentication);
    // if (authModel != null) {
    //   print("Try Refresh result SUCCESS");

    //   authentication.setAuthModel(authModel);

    //   return true;
    // } else {
    //   print("Try Refresh result FAIL");

    //   return false;
    // }
  }

  //TODO: DESCOMENTAR
  static Future<AuthModel> _tryRefresh() async {
  // static Future<AuthModel> _tryRefresh([Authentication authentication]) async {
    // try {
    //   Map body = {
    //     "client_id": 3,
    //     "client_secret": "EDX3Ct6xqaRl69WG79aRuHCyXuJ1VlOUy6wbkWlt",
    //     "grant_type": "refresh_token",
    //     "refresh_token": authentication.authModel.refreshToken,
    //   };

    //   String json = jsonEncode(body);

    //   Map<String, String> header = ConnectionHeaders.setHeaders(headerType: HeaderType.JSON_HEADER);

    //   Response response = await post(Myurl().auth, body: json, headers: header).timeout(Duration(seconds: 40));
    //   Map respBody = jsonDecode(response.body);
    //   print("↓---------------------------↓Get↓---------------------------↓");
    //   print("\n REFRESH TOKEN * \n ${Myurl().auth} (Code: ${response.statusCode}) \n ${response.body} \n\n");
    //   print("${Myurl().auth} (Code: ${response.statusCode})");
    //   MyPrint.logPrint("response body do refresh token: ${response.body}");
    //   // print(response.body);
    //   log(respBody['access_token']);
    //   print("↑---------------------------↑Get↑---------------------------↑");
    //   // String json = await RefreshManager.refreshToken();

    //   // dynamic map = jsonDecode(json);
    //   // int code = map['code'];
    //   // Map body = jsonDecode(map['data']);

    //   // if (code != 200) {
    //   //   if (code == 401) {
    //   //     authentication.logOut();
    //   //   }
    //   //   return null;
    //   // }

    //   if (response.statusCode != 200) {
    //     if (response.statusCode == 401) {
    //       authentication.logOut();
    //     }
    //     return null;
    //   }

    //   return AuthModel(
    //     acessToken: respBody['access_token'],
    //     refreshToken: respBody['refresh_token'],
    //     tokenType: respBody['token_type'],
    //   );
    //   // return AuthModel(
    //   //   acessToken: body['access_token'],
    //   //   refreshToken: body['refresh_token'],
    //   //   tokenType: body['token_type'],
    //   // );
    // } catch (e) {
    //   print("Erro no Try Refresh: $e");
    //   return null;
    // }
  }
}