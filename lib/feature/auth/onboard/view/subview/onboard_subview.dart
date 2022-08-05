import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/button/title_text_button.dart';
import '../../../../../core/components/indicator/loading_indicator.dart';
import '../../../../../core/constants/enums/navigation_enums.dart';
import '../../../../../core/extension/birthdate_input_formatter.dart';
import '../../../../../core/extension/navigation_extension.dart';
import '../../../../../core/extension/string_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../viewmodel/onboard_view_model.dart';

class OnBoardSubView extends StatelessWidget {
  const OnBoardSubView({Key? key}) : super(key: key);

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
            appBar: buildAppBar(context, viewModel),
            body: SingleChildScrollView(
                child: Observer(
                    builder: (_) => viewModel.isLoading
                        ? const LoadingIndicator()
                        : buildStudentForm(viewModel, context)))));
  }

  AppBar buildAppBar(BuildContext context, OnBoardViewModel viewModel) => AppBar(
      title: Text(LocaleKeys.onBoard_getStarted.tr(),
          style: TextStyle(color: context.colorScheme.onPrimary)),
      leading: IconButton(
          onPressed: () => viewModel.navigation.router.go(NavigationEnums.onBoardView.rawValue),
          icon: const Icon(Icons.arrow_back),
          color: context.colorScheme.onPrimary));

  Form buildStudentForm(OnBoardViewModel viewModel, BuildContext context) => Form(
        autovalidateMode: AutovalidateMode.always,
        key: viewModel.formStateOnBoardSubView,
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            children: <Widget>[
              buildNameTextField(viewModel, context),
              context.emptySizedHeightBoxLow3x,
              buildBirthDateTextField(viewModel, context),
              context.emptySizedHeightBoxLow3x,
              buildElevatedButton(context, viewModel)
            ],
          ),
        ),
      );

  TextFormField buildNameTextField(OnBoardViewModel viewModel, BuildContext context) =>
      TextFormField(
          controller: viewModel.nameTextFieldController,
          validator: (value) => value!.isNotEmpty ? null : LocaleKeys.isValidName.tr(),
          decoration: InputDecoration(labelText: LocaleKeys.onBoard_onBoardSubView_name.tr()));

  TextFormField buildBirthDateTextField(OnBoardViewModel viewModel, BuildContext context) =>
      TextFormField(
          controller: viewModel.dateTextFieldController,
          validator: (value) => value!.isValidDates ? null : LocaleKeys.isValidBirthDate.tr(),
          decoration: InputDecoration(labelText: LocaleKeys.onBoard_onBoardSubView_date.tr()),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.singleLineFormatter,
            BirthTextInputFormatter()
          ]);

  Widget buildElevatedButton(BuildContext context, OnBoardViewModel viewModel) => TitleTextButton(
      onPressed: viewModel.completeToOnBoardSubView,
      child: Center(child: Text(LocaleKeys.onBoard_onBoardSubView_button.tr())));
}
