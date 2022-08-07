import 'dart:async';

import '../../../constants/enums/network_connectivity_enums.dart';

typedef NetworkCallBack = void Function(NetworkConnectivityEnums result);

abstract class NetworkConnectivityInterface {
  Future<NetworkConnectivityEnums> checkNetworkConnectivity();
  void handleNetworkConnectivity(NetworkCallBack onChange);
  void dispose();
}
