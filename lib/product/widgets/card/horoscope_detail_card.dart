import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/image_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../feature/home/model/home_response_model.dart';

class HoroscopeDetailCard extends StatelessWidget {
  final String horoscopeSign;
  final HomeResponseModel homeResponseModel;

  const HoroscopeDetailCard(
      {super.key, required this.horoscopeSign, required this.homeResponseModel});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        elevation: 10,
        child: Padding(
            padding: context.paddingNormal,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(homeResponseModel.description!),
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
              Text(homeResponseModel.luckyNumber!),
              Text(LocaleKeys.home_luckyNumber.tr(), style: context.textTheme.caption)
            ],
          ),
          Column(
            children: [
              Text(homeResponseModel.color!),
              Text(LocaleKeys.home_color.tr(), style: context.textTheme.caption)
            ],
          ),
          Column(
            children: [
              Text(homeResponseModel.luckyTime!),
              Text(LocaleKeys.home_luckyTime.tr(), style: context.textTheme.caption)
            ],
          ),
          Column(children: [
            Text(homeResponseModel.mood!),
            Text(LocaleKeys.home_mood.tr(), style: context.textTheme.caption)
          ])
        ]);
  }

  Column buildCompatibilityColumn(BuildContext context) {
    return Column(children: [
      Text(LocaleKeys.home_compatibility.tr(), style: context.textTheme.caption),
      context.emptySizedHeightBoxLow3x,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(horoscopeSign.toLowerCase().toPNG,
            width: context.width * 0.2, height: context.height * 0.1),
        context.emptySizedHeightBoxLow,
        const Icon(Icons.compare_arrows_sharp),
        Image.asset(homeResponseModel.compatibility!.toLowerCase().toPNG,
            width: context.width * 0.2, height: context.height * 0.1),
        context.emptySizedHeightBoxLow
      ])
    ]);
  }
}
