enum NetworkRoutes { empty }

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.empty:
        return '';
      default:
        throw Exception('Not Found');
    }
  }
}
