import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/card/no_network_card.dart';
import '../../../../core/components/indicator/loading_indicator.dart';
import '../../../../core/constants/enums/navigation_enums.dart';
import '../../../../core/constants/enums/network_connectivity_enums.dart';
import '../../../../product/widgets/card/horoscope_detail_card.dart';
import '../../viewmodel/home_view_model.dart';

class HomeExploreView extends StatelessWidget {
  final String horoscopeSign;
  final String horoscopeSignForNetwork;

  const HomeExploreView(
      {Key? key, required this.horoscopeSign, required this.horoscopeSignForNetwork})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          model.getSpecificHoroscope(horoscopeSignForNetwork);
          model.networkConnectivity.handleNetworkConnectivity((result) {
            model.networkConnectivityEnums = result;
            model.getSpecificHoroscope(horoscopeSignForNetwork);
          });
        },
        onPageBuilder: (BuildContext context, HomeViewModel viewModel) => DefaultTabController(
            length: viewModel.tabBarTitles!.length,
            child: Scaffold(
                appBar: buildAppBar(viewModel),
                body: Observer(
                    builder: (_) =>
                        viewModel.networkConnectivityEnums == NetworkConnectivityEnums.off
                            ? const NoNetworkCard()
                            : viewModel.isLoading || viewModel.homeResponseModel == null
                                ? const LoadingIndicator()
                                : buildSingleChildScrollView(context, viewModel)))));
  }

  AppBar buildAppBar(HomeViewModel viewModel) => AppBar(
      title: Text(horoscopeSign.toCapitalized()),
      leading: IconButton(
          onPressed: () => viewModel.navigation.router.go(NavigationEnums.homeView.routeName),
          icon: const Icon(Icons.arrow_back)));

  SingleChildScrollView buildSingleChildScrollView(BuildContext context, HomeViewModel viewModel) =>
      SingleChildScrollView(
          child: Padding(
        padding: context.paddingNormal,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: context.height * 0.1, child: buildTabBar(viewModel)),
              context.emptySizedHeightBoxLow,
              buildObserverCard(viewModel, context)
            ]),
      ));

  Observer buildObserverCard(HomeViewModel viewModel, BuildContext context) => Observer(
      builder: (_) => viewModel.isFetching
          ? SizedBox(height: context.height * 0.4, child: const LoadingIndicator())
          : HoroscopeDetailCard(
              homeResponseModel: viewModel.homeResponseModel!,
              horoscopeSign: horoscopeSignForNetwork));

  TabBar buildTabBar(HomeViewModel viewModel) => TabBar(
      physics: const NeverScrollableScrollPhysics(),
      onTap: (value) {
        viewModel.changeTabIndex(value);
        viewModel.getSpecificHoroscope(horoscopeSignForNetwork);
      },
      tabs: viewModel.tabBarTitles!.map((title) => Tab(text: title)).toList());
}
