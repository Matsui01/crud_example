
import 'api.dart';

class ResponseModel {
  int code;
  dynamic body;
  ConnectionResultType connectionResultType;
  List<String> errorMessages;

  ResponseModel({
    this.code = 0,
    this.body,
    this.connectionResultType = ConnectionResultType.NONE,
    this.errorMessages,
  });
}
