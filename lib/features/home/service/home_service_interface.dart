import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/home_model.dart';
import '../model/home_response_model.dart';

abstract class IHomeService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  IHomeService(this.manager, this.scaffoldKey);

  Future<HomeResponseModel?> fetchHoroscope(HomeModel homeModel);
}
