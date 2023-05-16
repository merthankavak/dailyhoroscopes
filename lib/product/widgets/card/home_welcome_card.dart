import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/image_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../features/home/model/home_response_model.dart';
import '../../model/app_cache_model.dart';

class HomeWelcomeCard extends StatelessWidget {
  final HomeResponseModel homeResponseModel;
  final AppCacheModel appCacheModel;
  const HomeWelcomeCard({Key? key, required this.homeResponseModel, required this.appCacheModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: context.colorScheme.primary,
        margin: EdgeInsets.zero,
        elevation: 10,
        child: Padding(
            padding: context.paddingNormal,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [buildBirthDateColumn(context), buildHoroscopeSignColumn(context)])));
  }

  Column buildHoroscopeSignColumn(BuildContext context) {
    return Column(children: [
      Image.asset(appCacheModel.horoscopeSign!.toPNG,
          width: context.width * 0.2, height: context.height * 0.1),
      Text(homeResponseModel.dateRange!,
          style: context.textTheme.bodySmall!.copyWith(color: context.colorScheme.onBackground))
    ]);
  }

  Column buildBirthDateColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRichText(context),
        context.emptySizedHeightBoxLow,
        Text(appCacheModel.birthDate!,
            style: context.textTheme.bodySmall!.copyWith(color: context.colorScheme.onBackground)),
        Text(appCacheModel.horoscopeSign!.toCapitalized(),
            style: context.textTheme.bodySmall!.copyWith(color: context.colorScheme.onBackground))
      ],
    );
  }

  RichText buildRichText(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: LocaleKeys.home_welcome.tr(),
          style: context.textTheme.titleMedium!.copyWith(color: context.colorScheme.onBackground)),
      TextSpan(
          text: appCacheModel.name.toCapitalized(),
          style: context.textTheme.titleMedium!.copyWith(color: context.colorScheme.onPrimary))
    ]));
  }
}
