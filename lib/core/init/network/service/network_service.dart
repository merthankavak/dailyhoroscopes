import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vexana/vexana.dart';

class NetworkService {
  static NetworkService? _instance;
  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  NetworkService._init();

  static const int _timeout = 30000;

  final INetworkManager networkManager = NetworkManager<EmptyModel>(
    fileManager: LocalFile(),
    options: BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      followRedirects: false,
      receiveTimeout: const Duration(milliseconds: _timeout),
      sendTimeout: const Duration(milliseconds: _timeout),
    ),
  );
}
