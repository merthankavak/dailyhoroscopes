import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/indicator/loading_indicator.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/model/horoscope_info_model.dart';
import '../../../core/components/card/no_network_card.dart';
import '../../../core/constants/enums/network_connectivity_enums.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../product/widgets/card/home_welcome_card.dart';
import '../../../product/widgets/card/horoscope_detail_card.dart';
import '../../../product/widgets/card/horoscope_list_card.dart';
import '../../../product/widgets/dialog/logout_dialog.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, HomeViewModel viewModel) => DefaultTabController(
            length: viewModel.tabBarTitles!.length,
            child: Scaffold(
                key: viewModel.scaffoldKey,
                appBar: buildAppBar(viewModel, context),
                body: Observer(
                    builder: (_) =>
                        viewModel.networkConnectivityEnums == NetworkConnectivityEnums.off
                            ? const NoNetworkCard()
                            : viewModel.isLoading
                                ? const LoadingIndicator()
                                : viewModel.homeModel == null
                                    ? Center(child: Text(LocaleKeys.notFound.tr()))
                                    : buildSingleChildScrollView(context, viewModel)))));
  }

  AppBar buildAppBar(HomeViewModel viewModel, BuildContext context) =>
      AppBar(title: Text(LocaleKeys.home_appBarTitle.tr()), centerTitle: false, actions: [
        IconButton(
            onPressed: () => showPicker(viewModel, context), icon: const Icon(Icons.language)),
        IconButton(
            onPressed: () => alertDialog(viewModel, context),
            icon: const Icon(Icons.logout_rounded))
      ]);

  SingleChildScrollView buildSingleChildScrollView(BuildContext context, HomeViewModel viewModel) =>
      SingleChildScrollView(
          child: Padding(
              padding: context.paddingNormal,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HomeWelcomeCard(viewModel: viewModel),
                    context.emptySizedHeightBoxLow,
                    SizedBox(height: context.height * 0.1, child: buildTabBar(viewModel)),
                    context.emptySizedHeightBoxLow,
                    buildObserverCard(viewModel, context),
                    context.emptySizedHeightBoxLow3x,
                    Text(LocaleKeys.home_explore.tr(), style: context.textTheme.subtitle1),
                    context.emptySizedHeightBoxLow3x,
                    SizedBox(height: context.height * 0.2, child: buildExploreListView(viewModel))
                  ])));

  TabBar buildTabBar(HomeViewModel viewModel) => TabBar(
      physics: const NeverScrollableScrollPhysics(),
      onTap: (value) {
        viewModel.changeTabIndex(value);
        viewModel.getSpecificHoroscope(viewModel.appCacheModel!.horoscopeSign!);
      },
      tabs: viewModel.tabBarTitles!.map((title) => Tab(text: title)).toList());

  Observer buildObserverCard(HomeViewModel viewModel, BuildContext context) => Observer(
      builder: (_) => viewModel.isFetching
          ? SizedBox(height: context.height * 0.4, child: const LoadingIndicator())
          : HoroscopeDetailCard(
              viewModel: viewModel, horoscopeSign: viewModel.appCacheModel!.horoscopeSign!));

  Future<void> showPicker(HomeViewModel viewModel, BuildContext context) async =>
      showModalBottomSheet(
          context: context,
          builder: (context) => SafeArea(
                  child: Wrap(children: <Widget>[
                ListTile(
                    title: Text(LanguageManager.instance.enLocale.languageCode.toUpperCase()),
                    onTap: () {
                      viewModel.changeAppLocale(LanguageManager.instance.enLocale);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                    title: Text(LanguageManager.instance.trLocale.languageCode.toUpperCase()),
                    onTap: () {
                      viewModel.changeAppLocale(LanguageManager.instance.trLocale);
                      Navigator.of(context).pop();
                    })
              ])));

  ListView buildExploreListView(HomeViewModel viewModel) => ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: HoroscopeInfoModels.horoscopeInfoModels.length - 1,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () =>
              viewModel.sendExploreView(HoroscopeInfoModels.horoscopeInfoModels[index].signName),
          child: HoroscopeListCard(index: index, viewModel: viewModel)));

  Future<dynamic> alertDialog(HomeViewModel viewModel, BuildContext context) async => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => LogoutDialog(
          onPressedCancel: () => Navigator.of(context).pop(),
          onPressedContinue: viewModel.clearData));
}
