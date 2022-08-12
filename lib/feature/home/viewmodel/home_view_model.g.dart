// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$tabBarTitlesAtom =
      Atom(name: '_HomeViewModelBase.tabBarTitles', context: context);

  @override
  List<String>? get tabBarTitles {
    _$tabBarTitlesAtom.reportRead();
    return super.tabBarTitles;
  }

  @override
  set tabBarTitles(List<String>? value) {
    _$tabBarTitlesAtom.reportWrite(value, super.tabBarTitles, () {
      super.tabBarTitles = value;
    });
  }

  late final _$horoscopeNamesAtom =
      Atom(name: '_HomeViewModelBase.horoscopeNames', context: context);

  @override
  List<String>? get horoscopeNames {
    _$horoscopeNamesAtom.reportRead();
    return super.horoscopeNames;
  }

  @override
  set horoscopeNames(List<String>? value) {
    _$horoscopeNamesAtom.reportWrite(value, super.horoscopeNames, () {
      super.horoscopeNames = value;
    });
  }

  late final _$appLocaleAtom =
      Atom(name: '_HomeViewModelBase.appLocale', context: context);

  @override
  Locale get appLocale {
    _$appLocaleAtom.reportRead();
    return super.appLocale;
  }

  @override
  set appLocale(Locale value) {
    _$appLocaleAtom.reportWrite(value, super.appLocale, () {
      super.appLocale = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isFetchingAtom =
      Atom(name: '_HomeViewModelBase.isFetching', context: context);

  @override
  bool get isFetching {
    _$isFetchingAtom.reportRead();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.reportWrite(value, super.isFetching, () {
      super.isFetching = value;
    });
  }

  late final _$homeResponseModelAtom =
      Atom(name: '_HomeViewModelBase.homeResponseModel', context: context);

  @override
  HomeResponseModel? get homeResponseModel {
    _$homeResponseModelAtom.reportRead();
    return super.homeResponseModel;
  }

  @override
  set homeResponseModel(HomeResponseModel? value) {
    _$homeResponseModelAtom.reportWrite(value, super.homeResponseModel, () {
      super.homeResponseModel = value;
    });
  }

  late final _$networkConnectivityEnumsAtom = Atom(
      name: '_HomeViewModelBase.networkConnectivityEnums', context: context);

  @override
  NetworkConnectivityEnums? get networkConnectivityEnums {
    _$networkConnectivityEnumsAtom.reportRead();
    return super.networkConnectivityEnums;
  }

  @override
  set networkConnectivityEnums(NetworkConnectivityEnums? value) {
    _$networkConnectivityEnumsAtom
        .reportWrite(value, super.networkConnectivityEnums, () {
      super.networkConnectivityEnums = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_HomeViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$getDefaultHoroscopeAsyncAction =
      AsyncAction('_HomeViewModelBase.getDefaultHoroscope', context: context);

  @override
  Future<void> getDefaultHoroscope() {
    return _$getDefaultHoroscopeAsyncAction
        .run(() => super.getDefaultHoroscope());
  }

  late final _$getSpecificHoroscopeAsyncAction =
      AsyncAction('_HomeViewModelBase.getSpecificHoroscope', context: context);

  @override
  Future<void> getSpecificHoroscope(String horoscopeSign) {
    return _$getSpecificHoroscopeAsyncAction
        .run(() => super.getSpecificHoroscope(horoscopeSign));
  }

  late final _$changeAppLocaleAsyncAction =
      AsyncAction('_HomeViewModelBase.changeAppLocale', context: context);

  @override
  Future<void> changeAppLocale(Locale locale) {
    return _$changeAppLocaleAsyncAction
        .run(() => super.changeAppLocale(locale));
  }

  late final _$checkFirstTimeInternetConnectionAsyncAction = AsyncAction(
      '_HomeViewModelBase.checkFirstTimeInternetConnection',
      context: context);

  @override
  Future<void> checkFirstTimeInternetConnection() {
    return _$checkFirstTimeInternetConnectionAsyncAction
        .run(() => super.checkFirstTimeInternetConnection());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeFetching() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._changeFetching');
    try {
      return super._changeFetching();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTabIndex(int value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeTabIndex');
    try {
      return super.changeTabIndex(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabBarTitles: ${tabBarTitles},
horoscopeNames: ${horoscopeNames},
appLocale: ${appLocale},
isLoading: ${isLoading},
isFetching: ${isFetching},
homeResponseModel: ${homeResponseModel},
networkConnectivityEnums: ${networkConnectivityEnums},
currentIndex: ${currentIndex}
    ''';
  }
}
