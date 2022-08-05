import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with LightThemeInterface {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
      colorScheme: _appColorScheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      scaffoldBackgroundColor: colorSchemeLight!.white,
      textButtonTheme: textButtonTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      appBarTheme: appBarTheme,
      tabBarTheme: tabBarTheme,
      inputDecorationTheme: inputTheme);

  ColorScheme get _appColorScheme => ColorScheme(
      primary: colorSchemeLight!.purple,
      primaryContainer: colorSchemeLight!.white,
      secondary: colorSchemeLight!.darkPurple,
      secondaryContainer: colorSchemeLight!.lightBlue,
      surface: colorSchemeLight!.white,
      background: colorSchemeLight!.blue,
      error: colorSchemeLight!.red,
      onPrimary: colorSchemeLight!.white,
      onSecondary: colorSchemeLight!.black,
      onSurface: colorSchemeLight!.lightGray,
      onBackground: colorSchemeLight!.gray,
      onError: colorSchemeLight!.white,
      brightness: colorSchemeLight!.brightnessLight);

  FloatingActionButtonThemeData get floatingActionButtonTheme => FloatingActionButtonThemeData(
      foregroundColor: colorSchemeLight!.white,
      backgroundColor: colorSchemeLight!.lightPurple,
      focusColor: colorSchemeLight!.black,
      hoverColor: colorSchemeLight!.black12,
      splashColor: colorSchemeLight!.black);

  AppBarTheme get appBarTheme => AppBarTheme(
      systemOverlayStyle: colorSchemeLight!.systemUiOverlayLight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 65,
      shadowColor: colorSchemeLight!.black,
      titleTextStyle: TextStyle(color: colorSchemeLight!.black, fontSize: 17),
      iconTheme: IconThemeData(color: colorSchemeLight!.black),
      actionsIconTheme: IconThemeData(color: colorSchemeLight!.black),
      centerTitle: true);

  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: colorSchemeLight!.purple,
          onSurface: colorSchemeLight!.white,
          backgroundColor: colorSchemeLight!.purple,
          shadowColor: colorSchemeLight!.black,
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: colorSchemeLight!.black12, width: 2, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(2.0)))));

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: colorSchemeLight!.white,
          onPrimary: colorSchemeLight!.black,
          onSurface: colorSchemeLight!.black,
          shadowColor: colorSchemeLight!.black,
          alignment: Alignment.center,
          elevation: 10,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)))));

  InputDecorationTheme get inputTheme => InputDecorationTheme(
      hintStyle: TextStyle(
          color: colorSchemeLight!.black,
          fontSize: null,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal),
      errorMaxLines: null,
      isDense: false,
      isCollapsed: false,
      prefixStyle:
          const TextStyle(fontSize: null, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal),
      suffixStyle:
          const TextStyle(fontSize: null, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal),
      counterStyle:
          const TextStyle(fontSize: null, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal),
      filled: true,
      fillColor: colorSchemeLight!.white,
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorSchemeLight!.red, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: colorSchemeLight!.purple, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorSchemeLight!.red, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      disabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: colorSchemeLight!.white, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: colorSchemeLight!.purple, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      border: UnderlineInputBorder(
          borderSide:
              BorderSide(color: colorSchemeLight!.white, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(4.0))));

  TabBarTheme get tabBarTheme => TabBarTheme(
      labelColor: _appColorScheme.primary,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.5),
      indicator:
          UnderlineTabIndicator(borderSide: BorderSide(color: _appColorScheme.primary, width: 2)));
}
