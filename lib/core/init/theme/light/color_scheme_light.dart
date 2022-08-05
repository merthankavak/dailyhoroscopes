import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Brightness brightnessLight = Brightness.light;
  final SystemUiOverlayStyle systemUiOverlayLight = SystemUiOverlayStyle.light;

  final Color veryLightBlue = const Color(0xffF2F6F8);
  final Color lightBlue = const Color(0xff6184D8);
  final Color blue = const Color(0xff0055FF);
  final Color darkBlue = const Color(0xff153678);

  final Color white = const Color(0xffffffff);

  final Color lightGray = const Color(0xfff1f3f8);
  final Color gray = const Color(0xffa5a6ae);
  final Color darkGray = const Color(0xff676870);

  final Color black = const Color(0xff020306);
  final Color black12 = const Color(0x1f000000);
  final Color blackShadow = const Color(0x3d000000);

  final Color red = const Color(0xffc70137);
  final Color darkRed = const Color(0x80c70137);

  final Color lightGreen = const Color(0xff00C569);
  final Color forestGreen = const Color(0xff228B22);
  final Color green = const Color(0xff008000);
  final Color darkGreen = const Color(0xff1B512D);

  final Color yellow = const Color(0xFFcbd90a);

  final Color lightPurple = const Color(0xFF800080);
  final Color purple = const Color.fromARGB(255, 104, 36, 160);
  final Color darkPurple = const Color.fromARGB(255, 40, 3, 70);
}
