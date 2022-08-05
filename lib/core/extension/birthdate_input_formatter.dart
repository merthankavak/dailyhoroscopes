import 'package:flutter/services.dart';

class BirthTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    oldValue.text.length >= newValue.text.length ? newValue : null;
    var dateText = _addSeparator(newValue.text, '/');
    return newValue.copyWith(text: dateText, selection: updateCursorPosition(dateText));
  }

  String _addSeparator(String value, String separator) {
    value = value.replaceAll('/', '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1) {
        newString += separator;
      }
      if (i == 3) {
        newString += separator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) =>
      TextSelection.fromPosition(TextPosition(offset: text.length));
}
