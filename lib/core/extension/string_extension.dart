// ignore_for_file: unnecessary_this

import 'package:easy_localization/easy_localization.dart';

import '../constants/regex/regex_constants.dart';
import '../init/lang/locale_keys.g.dart';

extension StringExtension on String {
  String get locale => this.tr();
  String? get isValidDate =>
      contains(RegExp(RegexConstants.dateRegex)) ? null : LocaleKeys.isValidBirthDate.tr();
  bool get isValidDates => RegExp(RegexConstants.dateRegex).hasMatch(this);
}
