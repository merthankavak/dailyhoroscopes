import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkConnectivityEnums {
  on,
  off;

  static NetworkConnectivityEnums checkConnectivity(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return NetworkConnectivityEnums.on;
      case ConnectivityResult.wifi:
        return NetworkConnectivityEnums.on;
      case ConnectivityResult.none:
        return NetworkConnectivityEnums.off;
      default:
        return NetworkConnectivityEnums.off;
    }
  }
}
