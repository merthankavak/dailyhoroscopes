enum HoroscopeInfo {
  capricorn('capricorn', 0),
  aquarius('aquarius', 22),
  pisces('pisces', 20),
  aries('aries', 21),
  taurus('taurus', 21),
  gemini('gemini', 22),
  cancer('cancer', 23),
  leo('leo', 23),
  virgo('virgo', 23),
  libra('libra', 23),
  scorpio('scorpio', 23),
  sagittarius('sagittarius', 22),
  capricorn2('capricorn', 22);

  final String name;
  final int day;
  const HoroscopeInfo(this.name, this.day);

  static List<String> get horoscopeNames => HoroscopeInfo.values.map((e) => e.name).toList();
  static List<int> get horoscopeDays => HoroscopeInfo.values.map((e) => e.day).toList();

  static String getZodiacSign(String birthDate) {
    return int.parse(birthDate.split("/")[0]) <
            HoroscopeInfo.horoscopeDays[int.parse(birthDate.split("/")[1])]
        ? HoroscopeInfo.horoscopeNames[int.parse(birthDate.split("/")[1]) - 1]
        : HoroscopeInfo.horoscopeNames[int.parse(birthDate.split("/")[1])];
  }
}
