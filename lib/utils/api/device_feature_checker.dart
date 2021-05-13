import 'package:crud_example/utils/api/api.dart';

class DeviceFeatureChecker {
  static Future<bool> verifyNetwork() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      print(connectivityResult);

      if (connectivityResult == ConnectivityResult.none) return false;

      return true;
    } catch (e) {
      print("Erro ao obter tipo de rede: $e");
      return false;
    }
  }

  // static Future<bool> _verifyLocationEnabled() async {
  //   return await Geolocator.isLocationServiceEnabled();
  // }

  static Future<bool> verifyInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      print("Erro ao obter conexão $e");
      return false;
    }
  }
}
