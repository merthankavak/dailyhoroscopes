import 'package:easy_localization/easy_localization.dart';

import '../../../core/init/lang/locale_keys.g.dart';

enum DayEnum {
  yesterday('yesterday'),
  today('today'),
  tomorrow('tomorrow');

  final String dayName;
  const DayEnum(this.dayName);

  static List<String> get dayNamesForNetwork => DayEnum.values.map((e) => e.dayName).toList();
  static List<String> get dayNames => [
        LocaleKeys.home_tabBar_yesterday.tr(),
        LocaleKeys.home_tabBar_today.tr(),
        LocaleKeys.home_tabBar_tomorrow.tr()
      ];
}
