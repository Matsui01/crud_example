import 'api.dart';

class Connection {
  //------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------- Post ----------------------------------------------------
  //------------------------------------------------------------------------------------------------------------

  ///Use Header Type `JSON_HEADER`, `AUTH_TOKEN` or `""`
  static Future<ResponseModel> postRequest({String url, dynamic body, HeaderType headerType}) async {
    try {
      ResponseModel responseModel = await _internalPostRequest(url: url, body: body, headerType: headerType);
      if (responseModel.code != 200 && responseModel.code != 201) {
        responseModel = await ConnectionFailure.onFailRequest(responseModel, url);

        if (responseModel.connectionResultType == ConnectionResultType.REFRESH_SUCCESS) {
          responseModel = await _internalPostRequest(url: url, body: body, headerType: headerType);
          if (responseModel.code != 200 && responseModel.code != 201) {
            responseModel = await ConnectionFailure.onFailRequest(responseModel, url, false);
          }
        }
      } else {
        switch (responseModel.code) {
          case 200:
            responseModel.connectionResultType = ConnectionResultType.SUCCESS;
            break;
          case 201:
            responseModel.connectionResultType = ConnectionResultType.CREATED;
            break;
        }
      }

      return responseModel;
    } catch (e) {
      print('Erro Na Conexão Post => $e');
      return await ConnectionFailure.onFailRequest(ResponseModel(code: -1), url, false);
    }
  }

  static Future<ResponseModel> _internalPostRequest({String url, dynamic body, HeaderType headerType}) async {
    Map<String, String> header = ConnectionHeaders.setHeaders(headerType: headerType);

    String json = jsonEncode(body);

    Response response = await post(url, headers: header, body: json).timeout(Duration(seconds: 40));

    print("↓---------------------------↓Post↓---------------------------↓");
    print("⇝$url (Code: ${response.statusCode})");
    if (response.statusCode == 404)
      print("⇝${response.body.substring(0, 15)}");
    else
      print("⇝${response.body}");
    print("↑---------------------------↑Post↑---------------------------↑");

    dynamic responseBody;
    try {
      responseBody = jsonDecode(response.body);
    } catch (e) {
      print("Erro ao converter body para Json $e");
    }

    return ResponseModel(
      code: response.statusCode,
      body: responseBody,
      connectionResultType: ConnectionResultType.NONE,
    );
  }

  //------------------------------------------------------------------------------------------------------------
  //--------------------------------------------- Multpart Post ------------------------------------------------
  //------------------------------------------------------------------------------------------------------------

  static Future<ResponseModel> multpartPostRequest(
      {String url, dynamic body, List<MultipartFile> multipartFiles, HeaderType headerType, bool saveLocalData}) async {
    try {
      // String json = jsonEncode(body);
      ResponseModel responseModel = await _internalMultpartPostRequest(
          url: url, body: body, headerType: headerType, multipartFiles: multipartFiles);
      if (responseModel.code != 200 && responseModel.code != 201) {
        responseModel = await ConnectionFailure.onFailRequest(responseModel, url);

        if (responseModel.connectionResultType == ConnectionResultType.REFRESH_SUCCESS) {
          responseModel = await _internalMultpartPostRequest(
              url: url, body: body, headerType: headerType, multipartFiles: multipartFiles);
          if (responseModel.code != 200 && responseModel.code != 201) {
            responseModel = await ConnectionFailure.onFailRequest(responseModel, url, false);
          }
        }
      } else {
        switch (responseModel.code) {
          case 200:
            responseModel.connectionResultType = ConnectionResultType.SUCCESS;
            break;
          case 201:
            responseModel.connectionResultType = ConnectionResultType.CREATED;
            break;
        }
      }

      return responseModel;
    } catch (e) {
      print('Erro Na Conexão Multpart Post => $e');
      return await ConnectionFailure.onFailRequest(ResponseModel(code: -1), url, false);
    }
  }

  static Future<ResponseModel> _internalMultpartPostRequest(
      {String url, dynamic body, List<MultipartFile> multipartFiles, HeaderType headerType}) async {
    try {
      Map<String, String> header = ConnectionHeaders.setHeaders(headerType: headerType);
      print("header $header");
      // String json = jsonEncode(body);
      MultipartRequest request = MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(header);

      for (var i = 0; i < multipartFiles.length; i++) {
        request.files.add(multipartFiles[i]);
      }

      request.fields.addAll(body);
      print("request.fields ${request.fields}");
      StreamedResponse response = await request.send();

      final respStr = await response.stream.bytesToString();
      print("↓---------------------------↓Post↓---------------------------↓");
      MyPrint.logPrint(respStr);
      // print(respStr);
      print("⇝$url (Code: ${response.statusCode})");
      print("⇝${response.headers}");
      print("↑---------------------------↑Post↑---------------------------↑");

      // dynamic responseBody = jsonDecode(response.body);

      return ResponseModel(
        code: response.statusCode,
        // responseBody: responseBody,
        connectionResultType: ConnectionResultType.NONE,
      );
    } catch (e) {
      print("erro no MultpartRequest $e");
      return ResponseModel(code: -1);
    }
  }

  //------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------- GET -----------------------------------------------------
  //------------------------------------------------------------------------------------------------------------

  static Future<ResponseModel> getRequest({String url, HeaderType headerType, bool hasLocalData = false}) async {
    try {
      ResponseModel responseModel = await _internalGetRequest(url: url, headerType: headerType);
      if (responseModel.code != 200) {
        responseModel = await ConnectionFailure.onFailRequest(responseModel, url, true, hasLocalData);
        if (responseModel.connectionResultType == ConnectionResultType.REFRESH_SUCCESS) {
          responseModel = await _internalGetRequest(url: url, headerType: headerType);
          if (responseModel.code != 200 && responseModel.code != 201) {
            responseModel = await ConnectionFailure.onFailRequest(responseModel, url, false, hasLocalData);
          }
        }
      }

      if (responseModel.code == 200) {
        if (responseModel.connectionResultType != ConnectionResultType.LOCAL_DATA) {
          LocalDataChecker.saveLocalData(url, responseModel.body);
        }
      }

      return responseModel;
    } catch (e) {
      print('Erro Connection Get => $e');
      return await ConnectionFailure.onFailRequest(ResponseModel(code: -1), url, false);
    }
  }

  static Future<ResponseModel> _internalGetRequest({String url, HeaderType headerType}) async {
    Map<String, String> header = ConnectionHeaders.setHeaders(headerType: headerType);

    Response response = await get(url, headers: header).timeout(Duration(seconds: 40));

    // print("\n REQUISIÇÃO * \n $url (Code: ${response.statusCode}) \n ${response.body} \n\n");
    print("↓---------------------------↓Get↓---------------------------↓");
    print("$url (Code: ${response.statusCode})");
    if (response.statusCode == 404)
      print("⇝${response.body.substring(0, 15)}");
    else
      print("⇝${response.body}");
    // print(response.body);
    print("↑---------------------------↑Get↑---------------------------↑");
    dynamic responseBody;
    try {
      responseBody = jsonDecode(response.body);
    } catch (e) {
      print("Erro ao converter body para Json $e");
    }

    return ResponseModel(
      code: response.statusCode,
      body: responseBody,
      connectionResultType: ConnectionResultType.NONE,
    );
  }

  //------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------- PUT -----------------------------------------------------
  //------------------------------------------------------------------------------------------------------------

  ///Use Header Type `JSON_HEADER`, `AUTH_TOKEN` or `""`
  static Future<ResponseModel> putRequest({String url, dynamic body, HeaderType headerType}) async {
    try {
      ResponseModel responseModel = await _internalPutRequest(url: url, body: body, headerType: headerType);

      if (responseModel.code != 200 && responseModel.code != 201) {
        responseModel = await ConnectionFailure.onFailRequest(responseModel, url);

        if (responseModel.connectionResultType == ConnectionResultType.REFRESH_SUCCESS) {
          responseModel = await _internalPutRequest(url: url, body: body, headerType: headerType);

          if (responseModel.code != 200 && responseModel.code != 201) {
            responseModel = await ConnectionFailure.onFailRequest(responseModel, url, false);
          }
        }
      } else {
        switch (responseModel.code) {
          case 200:
            responseModel.connectionResultType = ConnectionResultType.SUCCESS;
            break;
          case 201:
            responseModel.connectionResultType = ConnectionResultType.CREATED;
            break;
        }
      }

      return responseModel;
    } catch (e) {
      print('Erro Na Conexão PUT => $e');
      return await ConnectionFailure.onFailRequest(ResponseModel(code: -1), url, false);
    }
  }

  static Future<ResponseModel> _internalPutRequest({String url, dynamic body, HeaderType headerType}) async {
    Map<String, String> header = ConnectionHeaders.setHeaders(headerType: headerType);

    String json = jsonEncode(body);

    Response response = await put(url, headers: header, body: json).timeout(Duration(seconds: 40));

    print("↓---------------------------↓PUT↓---------------------------↓");
    print("⇝$url (Code: ${response.statusCode})");
    if (response.statusCode == 404 || response.statusCode == 405) {
      print(response.body);
      // print("⇝${response.body.substring(0, 15)}");
    } else {
      print("⇝${response.body}");
    }
    print("↑---------------------------↑PUT↑---------------------------↑");

    dynamic responseBody;
    try {
      responseBody = jsonDecode(response.body);
    } catch (e) {
      print("Erro ao converter body para Json $e");
    }

    return ResponseModel(
      code: response.statusCode,
      body: responseBody,
      connectionResultType: ConnectionResultType.NONE,
    );
  }
  //------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------- DELETE -----------------------------------------------------
  //------------------------------------------------------------------------------------------------------------

  ///Use Header Type `JSON_HEADER`, `AUTH_TOKEN` or `""`
  static Future<ResponseModel> deleteRequest({String url, dynamic body, HeaderType headerType}) async {
    try {
      ResponseModel responseModel = await _internalDeleteRequest(url: url, body: body, headerType: headerType);

      if (responseModel.code != 200 && responseModel.code != 201) {
        responseModel = await ConnectionFailure.onFailRequest(responseModel, url);

        if (responseModel.connectionResultType == ConnectionResultType.REFRESH_SUCCESS) {
          responseModel = await _internalDeleteRequest(url: url, body: body, headerType: headerType);

          if (responseModel.code != 200 && responseModel.code != 201) {
            responseModel = await ConnectionFailure.onFailRequest(responseModel, url, false);
          }
        }
      } else {
        switch (responseModel.code) {
          case 200:
            responseModel.connectionResultType = ConnectionResultType.SUCCESS;
            break;
          case 201:
            responseModel.connectionResultType = ConnectionResultType.CREATED;
            break;
        }
      }

      return responseModel;
    } catch (e) {
      print('Erro Na Conexão DELETE => $e');
      return await ConnectionFailure.onFailRequest(ResponseModel(code: -1), url, false);
    }
  }

  static Future<ResponseModel> _internalDeleteRequest({String url, dynamic body, HeaderType headerType}) async {
    Map<String, String> header = ConnectionHeaders.setHeaders(headerType: headerType);

    Response response = await delete(url, headers: header).timeout(Duration(seconds: 40));

    print("↓---------------------------↓DELETE↓---------------------------↓");
    print("⇝$url (Code: ${response.statusCode})");
    if (response.statusCode == 404 || response.statusCode == 405) {
      print(response.body);
      // print("⇝${response.body.substring(0, 15)}");
    } else {
      print("⇝${response.body}");
    }
    print("↑---------------------------↑DELETE↑---------------------------↑");

    dynamic responseBody;
    try {
      responseBody = jsonDecode(response.body);
    } catch (e) {
      print("Erro ao converter body para Json $e");
    }

    return ResponseModel(
      code: response.statusCode,
      body: responseBody,
      connectionResultType: ConnectionResultType.NONE,
    );
  }
}
