import 'package:vexana/vexana.dart';

class NetworkService {
  static NetworkService? _instance;
  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  NetworkService._init();

  static const String _baseUrl = 'https://aztro.sameerkumar.website/';

  final INetworkManager networkManager =
      NetworkManager(fileManager: LocalFile(), options: BaseOptions(baseUrl: _baseUrl));
}
