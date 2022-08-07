import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class ServiceHelper {
  void showMessage(GlobalKey<ScaffoldState>? scaffoldKey, IErrorModel? errorModel) {
    if (scaffoldKey == null || errorModel == null) return;
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
        SnackBar(backgroundColor: Colors.black, content: Text(errorModel.statusCode.toString())));
  }
}
