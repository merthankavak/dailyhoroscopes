import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/image_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/light/color_scheme_light.dart';
import '../../../features/home/model/horoscope.dart';

class HoroscopeDetailCard extends StatelessWidget {
  final String horoscopeSign;
  final Horoscope horoscope;

  const HoroscopeDetailCard({super.key, required this.horoscopeSign, required this.horoscope});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        elevation: 10,
        child: Padding(
            padding: context.paddingNormal,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(horoscope.description!, textAlign: TextAlign.justify),
              context.emptySizedHeightBoxLow3x,
              buildMoodRow(context),
              context.emptySizedHeightBoxNormal,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildLoveColumn(context),
                  buildFriendshipColumn(context),
                  buildCareerColumn(context),
                ],
              )
            ])));
  }

  Column buildLoveColumn(BuildContext context) {
    return Column(children: [
      Text(LocaleKeys.home_love.tr(),
          style: context.textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline)),
      context.emptySizedHeightBoxLow3x,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(horoscope.matches!.love!.toLowerCase().toPNG,
            width: context.width * 0.1, height: context.height * 0.1),
      ]),
    ]);
  }

  Column buildFriendshipColumn(BuildContext context) {
    return Column(children: [
      Text(LocaleKeys.home_friendship.tr(),
          style: context.textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline)),
      context.emptySizedHeightBoxLow3x,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(horoscope.matches!.friendship!.toLowerCase().toPNG,
            width: context.width * 0.1, height: context.height * 0.1),
      ]),
    ]);
  }

  Column buildCareerColumn(BuildContext context) {
    return Column(children: [
      Text(LocaleKeys.home_career.tr(),
          style: context.textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline)),
      context.emptySizedHeightBoxLow3x,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(horoscope.matches!.career!.toLowerCase().toPNG,
            width: context.width * 0.1, height: context.height * 0.1),
      ]),
    ]);
  }

  Row buildMoodRow(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              RatingBarIndicator(
                rating: double.parse(horoscope.mood!.success!),
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: ColorSchemeLight.instance!.orange),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              Text(LocaleKeys.home_success.tr(), style: context.textTheme.bodySmall)
            ],
          ),
          Column(
            children: [
              RatingBarIndicator(
                rating: double.parse(horoscope.mood!.vibe!),
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: ColorSchemeLight.instance!.orange),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              Text(LocaleKeys.home_vibe.tr(), style: context.textTheme.bodySmall)
            ],
          ),
        ]);
  }
}
