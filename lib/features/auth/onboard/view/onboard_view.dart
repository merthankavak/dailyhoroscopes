import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/title_text_button.dart';
import '../../../../core/components/indicator/tab_indicator.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../model/onboard_model.dart';
import '../viewmodel/onboard_view_model.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
        viewModel: OnBoardViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
            backgroundColor: context.colorScheme.primary,
            body: Observer(
                builder: (_) => Column(children: [
                      const Spacer(flex: 1),
                      Expanded(flex: 6, child: buildPageView(viewModel)),
                      Expanded(flex: 1, child: buildTabIndicator(viewModel)),
                      Expanded(flex: 1, child: buildFooter(viewModel, context))
                    ]))));
  }

  TabIndicator buildTabIndicator(OnBoardViewModel viewModel) => TabIndicator(
      selectedIndex: viewModel.currentIndex, itemLength: viewModel.onBoardItems.length);

  Widget buildPageView(OnBoardViewModel viewModel) => PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) => viewModel.changeCurrentIndex(value),
      itemBuilder: (context, index) => buildColumnBody(context, viewModel.onBoardItems[index]));

  Widget buildFooter(OnBoardViewModel viewModel, BuildContext context) => SizedBox.expand(
      child: TitleTextButton(
          onPressed: viewModel.completeToOnBoard, child: Text(LocaleKeys.onBoard_getStarted.tr())));

  Widget buildColumnBody(BuildContext context, OnBoardModel model) => Padding(
        padding: context.paddingMedium,
        child: Column(
          children: [
            Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
            const Spacer(flex: 1),
            buildColumnDescription(context, model)
          ],
        ),
      );

  Widget buildColumnDescription(BuildContext context, OnBoardModel model) => Column(
        children: [
          buildAutoLocaleTextTitle(model, context),
          Padding(
              padding: context.verticalPaddingMedium,
              child: buildAutoLocalTextDescription(model, context))
        ],
      );

  Widget buildAutoLocaleTextTitle(OnBoardModel model, BuildContext context) => LocaleText(
      value: model.title,
      textAlign: TextAlign.center,
      textStyle:
          Theme.of(context).textTheme.headline6!.copyWith(color: context.colorScheme.onPrimary));

  Widget buildAutoLocalTextDescription(OnBoardModel model, BuildContext context) => LocaleText(
      value: model.desc,
      textAlign: TextAlign.center,
      textStyle:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: context.colorScheme.onPrimary));

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
