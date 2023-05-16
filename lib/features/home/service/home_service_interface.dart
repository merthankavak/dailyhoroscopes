import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/home_model.dart';
import '../model/horoscope.dart';

abstract class IHomeService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  IHomeService(this.manager, this.scaffoldKey);

  Future<Horoscope?> fetchHoroscope(HomeModel homeModel);
}
