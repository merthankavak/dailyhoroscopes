import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../product/model/horoscope_query_model.dart';
import '../model/home_model.dart';

abstract class IHomeService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  IHomeService(this.manager, this.scaffoldKey);

  Future<HomeModel?> fetchHoroscope(HoroscopeQueryModel horoscopeQueryModel);
}
