// ignore_for_file: library_private_types_in_public_api

import 'package:dailyhoroscopes/core/constants/enums/navigation_enums.dart';
import 'package:dailyhoroscopes/core/constants/enums/network_connectivity_enums.dart';
import 'package:dailyhoroscopes/core/init/cache/app_cache_manager.dart';
import 'package:dailyhoroscopes/core/init/cache/cache_manager_interface.dart';
import 'package:dailyhoroscopes/core/init/lang/language_manager.dart';
import 'package:dailyhoroscopes/core/init/lang/locale_keys.g.dart';
import 'package:dailyhoroscopes/core/init/network/connectivity/network_connectivity.dart';
import 'package:dailyhoroscopes/core/init/network/connectivity/network_connectivity_interface.dart';
import 'package:dailyhoroscopes/feature/home/service/home_service.dart';
import 'package:dailyhoroscopes/feature/home/service/home_service_interface.dart';
import 'package:dailyhoroscopes/product/constants/enum/day_enums.dart';
import 'package:dailyhoroscopes/product/model/app_cache_model.dart';
import 'package:dailyhoroscopes/product/model/horoscope_query_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/cache/cache_constants.dart';
import '../../../product/model/horoscope_info_model.dart';
import '../model/home_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late IHomeService homeService;
  late CacheManagerInterface<AppCacheModel> cacheManager;
  late NetworkConnectivityInterface networkConnectivity;

  List<String>? tabBarTitles;
  List<String>? dayNames;
  List<String>? horoscopeInfoList;

  AppCacheModel? appCacheModel;

  @observable
  Locale appLocale = LanguageManager.instance.enLocale;

  @observable
  bool isLoading = false;

  @observable
  bool isFetching = false;

  @observable
  HomeModel? homeModel;

  @observable
  NetworkConnectivityEnums? networkConnectivityEnums;

  @observable
  int currentIndex = 0;

  @override
  void init() {
    dayNames = DayEnum.dayNames;
    horoscopeInfoList = HoroscopeInfo.horoscopeNames;
    tabBarTitles = [
      LocaleKeys.home_tabBar_yesterday.tr(),
      LocaleKeys.home_tabBar_today.tr(),
      LocaleKeys.home_tabBar_tomorrow.tr()
    ];
    homeService = HomeService(networkService.networkManager, scaffoldKey);
    networkConnectivity = NetworkConnectivity();
    cacheManager = AppCacheManager(CacheConstants.appCache);
    getDefaultHoroscope();
    networkConnectivity.handleNetworkConnectivity((result) {
      networkConnectivityEnums = result;
      getDefaultHoroscope();
    });
  }

  @action
  void _changeLoading() => isLoading = !isLoading;

  @action
  void _changeFetching() => isFetching = !isFetching;

  @action
  Future<void> getDefaultHoroscope() async {
    _changeLoading();
    await cacheManager.init();
    appCacheModel = getUserData();
    homeModel = await homeService.fetchHoroscope(
        HoroscopeQueryModel(sign: appCacheModel!.horoscopeSign!, day: dayNames!.first));
    _changeLoading();
  }

  @action
  Future<void> getSpecificHoroscope(String horoscopeSign) async {
    _changeFetching();
    homeModel = await homeService
        .fetchHoroscope(HoroscopeQueryModel(sign: horoscopeSign, day: dayNames![currentIndex]));
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
    appLocale = locale;
    await baseContext.setLocale(locale);
  }

  AppCacheModel? getUserData() {
    return cacheManager.getItem(CacheConstants.appCache);
  }

  Future<void> checkFirstTimeInternetConnection() async {
    networkConnectivityEnums = await networkConnectivity.checkNetworkConnectivity();
  }

  void sendExploreView(String horoscopeSign) {
    navigation.router.goNamed(NavigationEnums.homeExploreView.routeName,
        params: {'horoscopeSign': horoscopeSign});
  }
}
