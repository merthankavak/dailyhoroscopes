// ignore_for_file: library_private_types_in_public_api

import 'package:dailyhoroscopes/core/constants/enums/navigation_enums.dart';
import 'package:dailyhoroscopes/core/constants/enums/network_connectivity_enums.dart';
import 'package:dailyhoroscopes/core/init/cache/app_cache_manager.dart';
import 'package:dailyhoroscopes/core/init/cache/cache_manager_interface.dart';
import 'package:dailyhoroscopes/core/init/lang/language_manager.dart';
import 'package:dailyhoroscopes/core/init/network/connectivity/network_connectivity.dart';
import 'package:dailyhoroscopes/core/init/network/connectivity/network_connectivity_interface.dart';
import 'package:dailyhoroscopes/features/home/model/home_model.dart';
import 'package:dailyhoroscopes/features/home/service/home_service.dart';
import 'package:dailyhoroscopes/features/home/service/home_service_interface.dart';
import 'package:dailyhoroscopes/product/constants/enum/day_enums.dart';
import 'package:dailyhoroscopes/product/model/app_cache_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/cache/cache_constants.dart';
import '../../../product/constants/enum/horoscope_info_enums.dart';
import '../model/horoscope.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late IHomeService homeService;
  late CacheManagerInterface<AppCacheModel> cacheManager;
  late NetworkConnectivityInterface networkConnectivity;

  @observable
  List<String>? tabBarTitles;

  List<String>? dayNamesForNetwork;

  @observable
  List<String>? horoscopeNames;

  List<String>? horoscopeNamesForNetwork;

  AppCacheModel? appCacheModel;

  @observable
  Locale appLocale = LanguageManager.instance.enLocale;

  @observable
  bool isLoading = false;

  @observable
  bool isFetching = false;

  @observable
  Horoscope? horoscope;

  @observable
  NetworkConnectivityEnums? networkConnectivityEnums;

  @observable
  int currentIndex = 0;

  @override
  void init() {
    dayNamesForNetwork = DayEnum.dayNamesForNetwork;
    horoscopeNames = HoroscopeInfo.horoscopeNames;
    horoscopeNamesForNetwork = HoroscopeInfo.horoscopeNamesForNetwork;
    tabBarTitles = DayEnum.dayNames;
    homeService = HomeService(networkService.networkManager, scaffoldKey);
    networkConnectivity = NetworkConnectivity();
    cacheManager = AppCacheManager(CacheConstants.appCache);
    checkFirstTimeInternetConnection();
  }

  @action
  void _changeLoading() => isLoading = !isLoading;

  @action
  void _changeFetching() => isFetching = !isFetching;

  @action
  Future<void> getUserHoroscope() async {
    _changeLoading();
    await cacheManager.init();
    appCacheModel = getUserData();
    horoscope = await homeService.fetchHoroscope(
        HomeModel(sign: appCacheModel?.horoscopeSign!, day: dayNamesForNetwork?.first));
    _changeLoading();
  }

  @action
  Future<void> getSpecificHoroscope(String horoscopeSign) async {
    _changeFetching();
    horoscope = await homeService
        .fetchHoroscope(HomeModel(sign: horoscopeSign, day: dayNamesForNetwork![currentIndex]));
    _changeFetching();
  }

  Future<void> clearData() async {
    _changeLoading();
    await cacheManager.init();
    await cacheManager.clear();
    navigation.router.go(NavigationEnums.onBoardView.routeName);
    _changeLoading();
  }

  @action
  void changeTabIndex(int value) => currentIndex = value;

  @action
  Future<void> changeAppLocale(Locale locale) async {
    _changeLoading();
    appLocale = locale;
    await baseContext.setLocale(locale);
    tabBarTitles = DayEnum.dayNames;
    horoscopeNames = HoroscopeInfo.horoscopeNames;
    _changeLoading();
  }

  AppCacheModel? getUserData() => cacheManager.getItem(CacheConstants.appCache);

  @action
  Future<void> checkFirstTimeInternetConnection() async =>
      networkConnectivityEnums = await networkConnectivity.checkNetworkConnectivity();

  void sendExploreView(String horoscopeSign, String horoscopeSignForNetwork) {
    navigation.router.goNamed(NavigationEnums.homeExploreView.routeName, pathParameters: {
      'horoscopeSign': horoscopeSign,
      'horoscopeSignForNetwork': horoscopeSignForNetwork
    });
  }
}
