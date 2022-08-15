// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnBoardViewModel on _OnBoardViewModelBase, Store {
  Computed<bool>? _$isLastPageComputed;

  @override
  bool get isLastPage =>
      (_$isLastPageComputed ??= Computed<bool>(() => super.isLastPage,
              name: '_OnBoardViewModelBase.isLastPage'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_OnBoardViewModelBase.isLoading', context: context);

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

  late final _$currentIndexAtom =
      Atom(name: '_OnBoardViewModelBase.currentIndex', context: context);

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

  late final _$saveCacheAsyncAction =
      AsyncAction('_OnBoardViewModelBase.saveCache', context: context);

  @override
  Future<void> saveCache() {
    return _$saveCacheAsyncAction.run(() => super.saveCache());
  }

  late final _$completeToOnBoardSubViewAsyncAction = AsyncAction(
      '_OnBoardViewModelBase.completeToOnBoardSubView',
      context: context);

  @override
  Future<void> completeToOnBoardSubView() {
    return _$completeToOnBoardSubViewAsyncAction
        .run(() => super.completeToOnBoardSubView());
  }

  late final _$_OnBoardViewModelBaseActionController =
      ActionController(name: '_OnBoardViewModelBase', context: context);

  @override
  void changeCurrentIndex([int? value]) {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(value);
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementSelectedPage([int? value]) {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.incrementSelectedPage');
    try {
      return super.incrementSelectedPage(value);
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentIndex: ${currentIndex},
isLastPage: ${isLastPage}
    ''';
  }
}
