import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/image_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) => Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [buildClipImage(context), buildAnimatedText(context)]),
        ),
      ),
    );
  }

  ClipRRect buildClipImage(BuildContext context) => ClipRRect(
      borderRadius: context.highBorderRadius,
      child: Image.asset(''.appIcon,
          height: context.height * 0.4, width: context.width * 0.6, fit: BoxFit.fill));

  TextLiquidFill buildAnimatedText(BuildContext context) => TextLiquidFill(
      text: LocaleKeys.splash_welcome.tr(),
      boxHeight: context.height * 0.1,
      waveDuration: context.durationNormal,
      boxBackgroundColor: context.colorScheme.onPrimary,
      textStyle: context.textTheme.titleLarge!);
}
