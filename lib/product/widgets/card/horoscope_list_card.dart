import '../../../feature/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/image_extension.dart';
import '../../model/horoscope_info_model.dart';

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
              Image.asset(HoroscopeInfoModels.horoscopeInfoModels[index].signName.toPNG,
                  width: context.width * 0.2, height: context.height * 0.1),
              context.emptySizedHeightBoxLow,
              Text(viewModel.horoscopeInfoModelsLang![index].signName)
            ]));
  }
}
