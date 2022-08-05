import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/image_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../feature/home/viewmodel/home_view_model.dart';

class HoroscopeDetailCard extends StatelessWidget {
  final String horoscopeSign;
  final HomeViewModel viewModel;

  const HoroscopeDetailCard({super.key, required this.horoscopeSign, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        elevation: 10,
        child: Padding(
            padding: context.paddingNormal,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(viewModel.homeModel!.description!),
              context.emptySizedHeightBoxLow3x,
              buildDetailsRow(context),
              context.emptySizedHeightBoxNormal,
              buildCompatibilityColumn(context)
            ])));
  }

  Row buildDetailsRow(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(viewModel.homeModel!.luckyNumber!),
              Text(LocaleKeys.home_luckyNumber.tr(), style: context.textTheme.caption)
            ],
          ),
          Column(
            children: [
              Text(viewModel.homeModel!.color!),
              Text(LocaleKeys.home_color.tr(), style: context.textTheme.caption)
            ],
          ),
          Column(
            children: [
              Text(viewModel.homeModel!.luckyTime!),
              Text(LocaleKeys.home_luckyTime.tr(), style: context.textTheme.caption)
            ],
          ),
          Column(children: [
            Text(viewModel.homeModel!.mood!),
            Text(LocaleKeys.home_mood.tr(), style: context.textTheme.caption)
          ])
        ]);
  }

  Column buildCompatibilityColumn(BuildContext context) {
    return Column(children: [
      Text(LocaleKeys.home_compatibility.tr(), style: context.textTheme.caption),
      context.emptySizedHeightBoxLow3x,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Image.asset(horoscopeSign.toPNG,
              width: context.width * 0.2, height: context.height * 0.1),
          context.emptySizedHeightBoxLow,
          Text(horoscopeSign.toCapitalized(), style: context.textTheme.bodySmall!)
        ]),
        const Icon(Icons.compare_arrows_sharp),
        Column(children: [
          Image.asset(viewModel.homeModel!.compatibility!.toLowerCase().toPNG,
              width: context.width * 0.2, height: context.height * 0.1),
          context.emptySizedHeightBoxLow,
          Text(viewModel.homeModel!.compatibility!, style: context.textTheme.bodySmall!)
        ])
      ])
    ]);
  }
}
