import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class MyIo {
  static Future<dynamic> save(String key, dynamic content) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String json = "";
      if (content.runtimeType != String) {
        json = jsonEncode(content);
      } else {
        json = content;
      }
      // print("Json para salver ⇝ $json");
      return await prefs.setString(key, json);
    } catch (e) {
      print("Erro ao Salvar informações :::: $key \n $e");
      return null;
    }
  }

  static Future<dynamic> saveBool(String key, bool value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setBool(key, value);
    } catch (e) {
      print("Erro ao Obter informações MyIo.load(\"$key\") :: \n $e");
      return null;
    }
  }

  static Future<dynamic> loadBool(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(key);
    } catch (e) {
      print("Erro ao Obter informações MyIo.load(\"$key\") :: \n $e");
      return null;
    }
  }

  static Future<dynamic> load(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await jsonDecode(prefs.getString(key));
    } catch (e) {
      print("Erro ao Obter informações MyIo.load(\"$key\") :: \n $e");
      return null;
    }
  }

  static Future<dynamic> delete([String key]) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (key != null) {
        prefs.remove(key);
      } else {
        prefs.clear();
      }
      print("$key apagada com sucesso");
    } catch (e) {
      print("Erro ao Obter informações MyIo.load(\"$key\") :: \n $e");
      return null;
    }
  }
}
