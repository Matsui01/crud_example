import 'package:flutter/material.dart';

class AuthModel {
  String tokenType;
  String expiresIn;
  String acessToken;
  String refreshToken;

  AuthModel({
    @required this.tokenType,
    @required this.acessToken,
    @required this.refreshToken,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    acessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() => {
        'token_type': tokenType,
        'access_token': acessToken,
        'refresh_token': refreshToken,
      };
}
