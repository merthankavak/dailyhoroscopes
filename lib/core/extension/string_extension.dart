// ignore_for_file: unnecessary_this

import 'package:easy_localization/easy_localization.dart';

import '../../product/model/horoscope_info_model.dart';
import '../constants/regex/regex_constants.dart';
import '../init/lang/locale_keys.g.dart';

extension StringExtension on String {
  String get locale => this.tr();
  String? get isValidDate =>
      contains(RegExp(RegexConstants.dateRegex)) ? null : LocaleKeys.isValidBirthDate.tr();
  bool get isValidDates => RegExp(RegexConstants.dateRegex).hasMatch(this);

  String get getZodiacSignName =>
      int.parse(this.split("/")[0]) < HoroscopeInfoModels.signDays[int.parse(this.split("/")[1])]
          ? HoroscopeInfoModels.horoscopeInfoModels[int.parse(this.split("/")[1]) - 1].signName
          : HoroscopeInfoModels.horoscopeInfoModels[int.parse(this.split("/")[1])].signName;
}
