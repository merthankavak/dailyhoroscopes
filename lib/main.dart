import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/app/application_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme_light.dart';

Future<void> main() async {
  await _init();
  runApp(EasyLocalization(
      path: ApplicationConstants.langAssetPath,
      supportedLocales: LanguageManager.instance.supportedLocales,
      startLocale: LanguageManager.instance.enLocale,
      child: MyApp()));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  final navigationService = NavigationService.instance;
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemeLight.instance.theme,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        routeInformationParser: navigationService.router.routeInformationParser,
        routeInformationProvider: navigationService.router.routeInformationProvider,
        routerDelegate: navigationService.router.routerDelegate);
  }
}
