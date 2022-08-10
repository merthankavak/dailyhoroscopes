enum DayEnum {
  yesterday('yesterday'),
  today('today'),
  tomorrow('tomorrow');

  final String dayName;
  const DayEnum(this.dayName);

  static List<String> get dayNames => DayEnum.values.map((e) => e.dayName).toList();
}
