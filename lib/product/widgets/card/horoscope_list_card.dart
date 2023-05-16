import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/image_extension.dart';
import '../../../features/home/viewmodel/home_view_model.dart';
import '../../constants/enum/horoscope_info_enums.dart';

class HoroscopeListCard extends StatelessWidget {
  final HomeViewModel viewModel;
  final int index;

  const HoroscopeListCard({super.key, required this.viewModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(HoroscopeInfo.horoscopeNamesForNetwork[index].toPNG,
                  width: context.width * 0.2, height: context.height * 0.1),
              context.emptySizedHeightBoxLow,
              Text(viewModel.horoscopeNames![index])
            ]));
  }
}
