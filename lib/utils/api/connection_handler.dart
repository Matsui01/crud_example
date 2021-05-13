import 'package:crud_example/utils/api/api.dart';

class ConnectionHandler {
  static Future errorHandler(Function retry) async {
    if (!await DeviceFeatureChecker.verifyNetwork()) {
      NavigatorController().navigatorKey.currentState.pushNamed(
        'connectionHandler',
        arguments: {
          "connectionErrorType": ConnectionErrorType.INTERNET,
          "retry": retry,
        },
      );
      return;
    }
    NavigatorController().navigatorKey.currentState.pushNamed(
      'connectionHandler',
      arguments: {
        "connectionErrorType": ConnectionErrorType.SOMETHING_WRONG,
        "retry": retry,
      },
    );
  }
}
