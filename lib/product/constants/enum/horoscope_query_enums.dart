enum HoroscopeQueryEnum { sign, day }

extension HoroscopeQueryEnumExtension on HoroscopeQueryEnum {
  String get rawValue {
    switch (this) {
      case HoroscopeQueryEnum.sign:
        return 'sign';
      case HoroscopeQueryEnum.day:
        return 'day';
      default:
        throw Exception('Not found');
    }
  }
}
