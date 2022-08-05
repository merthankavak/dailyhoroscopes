class HoroscopeInfoModel {
  final String signName;

  HoroscopeInfoModel(this.signName);
}

class HoroscopeInfoModels {
  static final List<HoroscopeInfoModel> horoscopeInfoModels = [
    HoroscopeInfoModel('capricorn'),
    HoroscopeInfoModel('aquarius'),
    HoroscopeInfoModel('pisces'),
    HoroscopeInfoModel('aries'),
    HoroscopeInfoModel('taurus'),
    HoroscopeInfoModel('gemini'),
    HoroscopeInfoModel('cancer'),
    HoroscopeInfoModel('leo'),
    HoroscopeInfoModel('virgo'),
    HoroscopeInfoModel('libra'),
    HoroscopeInfoModel('scorpio'),
    HoroscopeInfoModel('sagittarius'),
    HoroscopeInfoModel('capricorn'),
  ];

  static final List<int> signDays = [0, 22, 20, 21, 21, 22, 23, 23, 23, 23, 23, 22, 22];
}
