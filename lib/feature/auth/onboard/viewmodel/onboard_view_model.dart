// ignore_for_file: library_private_types_in_public_api

import 'package:dailyhoroscopes/core/constants/cache/cache_constants.dart';
import 'package:dailyhoroscopes/core/init/cache/app_cache_manager.dart';
import 'package:dailyhoroscopes/core/init/cache/cache_manager_interface.dart';
import 'package:dailyhoroscopes/product/model/app_cache_model.dart';
import 'package:dailyhoroscopes/product/model/horoscope_info_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/enums/navigation_enums.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/constants/image/svg_image_path.dart';
import '../model/onboard_model.dart';

part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<FormState> formStateOnBoardSubView = GlobalKey();

  TextEditingController? nameTextFieldController;
  TextEditingController? dateTextFieldController;

  late final CacheManagerInterface<AppCacheModel> cacheManager;

  List<OnBoardModel> onBoardItems = [];

  AppCacheModel? appCacheModel;

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @computed
  bool get isLastPage => onBoardItems.length - 1 == currentIndex;

  @override
  void init() {
    cacheManager = AppCacheManager(CacheConstants.appCache);
    nameTextFieldController = TextEditingController();
    dateTextFieldController = TextEditingController();
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title.tr(),
        LocaleKeys.onBoard_page1_desc.tr(), SvgImagePaths.instance.onboard1));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title.tr(),
        LocaleKeys.onBoard_page2_desc.tr(), SvgImagePaths.instance.onboard2));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title.tr(),
        LocaleKeys.onBoard_page3_desc.tr(), SvgImagePaths.instance.onboard3));
  }

  @action
  void changeCurrentIndex([int? value]) {
    if (isLastPage && value == null) return;
    incrementSelectedPage(value);
  }

  @action
  void incrementSelectedPage([int? value]) => value != null ? currentIndex = value : currentIndex++;

  @action
  void _changeLoading() => isLoading = !isLoading;

  @action
  Future<void> completeToOnBoardSubView() async {
    _changeLoading();
    if (formStateOnBoardSubView.currentState!.validate()) {
      appCacheModel = AppCacheModel(
          id: UniqueKey().hashCode,
          name: nameTextFieldController!.text,
          birthDate: dateTextFieldController!.text,
          isFirstInit: false,
          horoscopeSign: HoroscopeInfo.getZodiacSign(dateTextFieldController!.text));
      await cacheManager.init();
      await cacheManager.putItem(CacheConstants.appCache, appCacheModel!);
    }
    navigation.router.go(NavigationEnums.homeView.routeName);
    _changeLoading();
  }

  void completeToOnBoard() => navigation.router.go(NavigationEnums.onBoardSubView.routeName);
}
